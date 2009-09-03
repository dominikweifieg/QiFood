# Helper section for SifrHelper, only visible if using the Engines plugin
class SifrController < ApplicationController
  layout 'sifr_layout'

  def index
    # Get our options
    @sifr_version = Sifr.version
    @font_path = Sifr.option(:font_path)
    @font_path += '/' unless @font_path.ends_with?('/')
    
    # Find all installed font files
    @fonts = []
    path = Pathname.new(RAILS_ROOT)
    path += 'public' + @font_path
    @search_path = path
    if path.exist?
      path.children(true).each do |entry|
        if !entry.nil? && entry.file?
          ext = entry.extname
          if ext == '.swf'
            @fonts << entry.basename(ext).to_s
          end
        end
      end
    end
    @fonts.sort!
  end
end
