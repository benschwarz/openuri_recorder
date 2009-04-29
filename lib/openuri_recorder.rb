require 'open-uri'
require 'digest/md5'
require 'fileutils'

RECORD_PATH = File.join(Dir.pwd, 'open-uri-recordings')
FileUtils.mkdir_p(RECORD_PATH)

module Kernel
  alias_method :openuri_unmodified, :open
  
  private
    
  def open(uri, *rest, &block)
    OpenURI::Recorder.open(uri, *rest, &block)
  end
end

module OpenURI
  module Recorder
    class << self
      def open(uri, *rest, &block)
        response = StringIO.new(openuri_unmodified(uri, *rest, &block).read)
      
        unless File.exists?(File.join(RECORD_PATH, Digest::MD5.hexdigest(uri)))
          Manifest.add(uri)
          record(uri)
        end
      
        if block_given?
          begin
            yield response
          ensure
            response.close
          end
        else
          response
        end
      end
    
      def record(uri)
        File.open(File.join(RECORD_PATH, Digest::MD5.hexdigest(uri)), 'w') {|f| f.write(`curl -i #{uri}`) }
      end
    end
    
    module Manifest
      class << self
        def file
          @file ||= File.new(File.join(RECORD_PATH, "MANIFEST"), "a")
        end
      
        def add(uri)
          file.write "#{Digest::MD5.hexdigest(uri)} #{uri}\n"
        end
      end
    end
  end
end