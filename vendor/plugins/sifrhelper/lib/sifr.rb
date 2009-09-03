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

# The Sifr class holds global SifrHelper options
class Sifr

  # Our version
  @@version = '2_0_6'
  # Default options
  @@options = {:font_path => '/fonts/'}
  
  # Optional (but recommended!) call to set up global SifrHelper options.  Note that sIFR libraries before
  # version 2.0.3 had a javascript injection flaw that could allow 
  # malicious websites to trick visitors into running JavaScript code on domains hosting sIFR movies.
  #
  # *Usage*: Call at the end of environment.rb with a version (eg '2_0_6') and options as needed:
  #
  #   Sifr.init('2_0_6',:font_path => '/my_fonts/')
  #
  # *Arguments*:
  #
  # [version] One of '2_0_2', '2_0_5' or '2_0_6', selects which sifr.js file to use, must match version your fonts were built with
  # [options] An optional hash of options, with the following possible keys:
  # * :font_path - URL header for font files, defaults to '/fonts/'
  #
  def self.init(version, options = {})
    @@version = version
    @@options = {
      :font_path => '/fonts/'
    }.update(options)
  end
  
  # Returns the current version of sIFR being used
  def self.version
    @@version
  end
  
  # Get a given SifrHelper option (set using sifr_init)
  def self.option(key)
    @@options[key]
  end
  
  # When true, Engines plugin is installed, can use trickery
  def self.using_engines?
    File.directory?(RAILS_ROOT + "/vendor/plugins/engines")
  end
  
  # Returns an array of installed font names
  def self.installed_fonts
    # Get our options
    font_path = Sifr.option(:font_path)
    font_path += '/' unless font_path.ends_with?('/')
    
    # Find all installed font files
    fonts = []
    path = Pathname.new(RAILS_ROOT)
    path += 'public' + font_path
    if path.exist?
      path.children(true).each do |entry|
        if !entry.nil? && entry.file?
          ext = entry.extname
          if ext == '.swf'
            fonts << entry.basename(ext).to_s
          end
        end
      end
    end
    
    fonts.sort!
    fonts
  end
end
