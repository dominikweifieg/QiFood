#--
# SifrHelper - A Ruby on Rails plugin for sIFR-based rich fontography
# Copyright (C) 2007, Rob Morris
# 
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#++

require 'sifr'

# The SifrHelper module is mixed in to the ActionView::Base class at load, and provides the core of the SifrHelper
# functionality.  Check out the README for an overview, or individual methods for their usage and options.
module SifrHelper

  # Includes all needed CSS and Javascript libraries, and adds dynamically generated tweaks as needed.  
  #
  # *Note*: If the Engines plugin is installed, will find the .css and .js files automagically.  If not, will expect
  # them to have been moved to RAILS_ROOT/public/javascripts|stylesheets/.
  #
  # *Usage*: Add the following line within the <head> section of your layout (or view, if you only need 
  # sIFR-ized fonts on a single page):
  #   
  #   <%= sifr_head_generator -%>
  #
  def sifr_head_generator()
    # What version are we targeting?
    version = Sifr.version
    # Get out text buffer started up...
    text = "<!-- Using sIFR Version: #{version} -->\n"
    if using_sifr?
      # We're needed!  Add in our links for CSS & JS files that implement the sIFR library
      if Sifr.using_engines?
        # Use our managed folders for the relevant CSS & JS files
        text += stylesheet_link_tag('sIFR-screen', :plugin => 'sifrhelper', :media => 'screen') + "\n" +
          stylesheet_link_tag('sIFR-print', :plugin => 'sifrhelper', :media => 'print') + "\n" +
          javascript_include_tag("sifr_#{version}", :plugin => 'sifrhelper') + "\n"
      else 
        # Engines plugin not installed.  Use standard location instead.
        text += stylesheet_link_tag('sIFR-screen', :media => 'screen') + "\n" +
          stylesheet_link_tag('sIFR-print', :media => 'print') + "\n" +
          javascript_include_tag("sifr_#{version}") + "\n"
      end
      # Add in the tweaks.  These CSS items are temporary, and are never shown to the user.
      # They simply help with the layout during size calculations.  I've found :tweak_size to be
      # more useful here.
      text += "<style type=\"text/css\" media=\"screen\">\n"
      @sifr.each do |key, vals|
        text += ".sIFR-hasFlash #{key} {\n" +
          "  visibility: hidden;\n"
        text += "  font-size: #{vals[:tweak_size].to_s}px;\n" unless vals[:tweak_size].blank?
        text += "  letter-spacing: #{vals[:tweak_spacing].to_s}px;\n" unless vals[:tweak_spacing].blank?
        text += "}\n"
      end
      text += "</style>\n"
    end
    return text
  end

  # Generates the replacement calls to the sIFR Javascript library.
  #
  # *Usage*: Add the following line at the end of the <body> section of your layout (or view):
  #
  #   <%= sifr_body_generator -%>
  #
  def sifr_body_generator()
    text = ""
    if using_sifr?
      text = "<script type=\"text/javascript\">\n//<![CDATA[\nif(typeof sIFR == \"function\"){\n"
      
      font_path = Sifr.option(:font_path)
      @sifr.each do |key,vals|
        font = vals[:font]
        if font.is_a?(Symbol) || !font.ends_with?('.swf')
          url = font_path + font.to_s + '.swf'
        else
          url = font
        end
        mode = (vals[:wmode] || :opaque).to_s
        text += "sIFR.replaceElement(named({\n" +
          "sWmode:\"#{mode}\",\n" +
          "sSelector:\"#{key.to_s}\",\n" +
          "sFlashSrc:\"#{url}\",\n" +
          "sColor:\"#{(vals[:color]||'#000000').to_s}\",\n" +
          "sBgColor:\"#{(vals[:bgcolor]||'#ffffff').to_s}\",\n" +
          "nPaddingTop:#{(vals[:padding_top]||0).to_s},\n" +
          "nPaddingBottom:#{(vals[:padding_bottom]||0).to_s},\n" +
          "sFlashVars:\"#{(vals[:centered]!=true ? '' : 'textalign=center')}\",\n" +
          "sLinkColor:\"#{(vals[:linkcolor]||vals[:color]||'#000000').to_s}\",\n" +
          "sHoverColor:\"#{(vals[:hovercolor]||vals[:linkcolor]||vals[:color]||'#000000').to_s}\"\n" +
          "}));\n"
      end
      text += "};\n//]]>\n</script>\n"
    end
    return text
  end

  # Replaces a given CSS id, class or other selector with the specified font.
  #
  # *Usage*: Add a call in your view for each CSS element & font pair you want sIFR-ized, like so:
  #
  #   <% sifr_replace('.some_class', :my_font, :color => '#ff0000') %>
  #
  # *Arguments*:
  #
  # [selector] Any valid CSS selector
  # [font] Symbol for the font file to be used, so for a file named trebuchet_bold.swf, the font would be :trebuchet_bold
  #   Note that you can also pass a full url (eg '/special/my_font.swf') for this param, which will ignore any
  #   automatic path generation.  Doing so will ignore the :font_path init() option if set!
  # [options] An optional hash of options, with the following possible keys:
  # * :color - color for the text, in the web-standard '#RRGGBB' hex encoding format, defaults to #000000
  # * :bgcolor - background color for text, defaults to #FFFFFF
  # * :linkcolor - color for anchor text, defaults to :color or #000000 if none specified
  # * :hovercolor - color for anchor text on hover, defaults to :linkcolor or #000000 if none specified
  # * :centered - set to true to center text
  # * :padding_top - top padding in pixels, defaults to 0
  # * :padding_bottom - bottom padding in pixels, defaults to 0
  # * :tweak_size - helps when adjusting sIFR text to match normal styled text size and layout
  # * :tweak_spacing - helps when adjusting sIFR text, this one modifies line-spacing
  # * :wmode - one of :opaque, :transparent, :window, defaults to :opaque which is highly recommended!
  #
  def sifr_replace(selector, font, options={})
    get_sifr

    # Save off the options, keyed to the selector, for use in the sifr_body_generator call
    options[:font] = font
    @sifr[selector] = options
  end

  # Returns the version of the sIFR library that is included in the SifrHelper engine.
  #
  def sifr_lib_version()
    Sifr.version.to_s
  end

  protected
  
  # Get the hash of css selector => options hash for this page
  def get_sifr()
    @sifr ||= {}
    @sifr
  end

  # When true, we have a font to replace on this page
  def using_sifr?()
    return !get_sifr().empty?
  end

end
