# Add our helper methods to Rails' Views
ActionView::Base.send :include, SifrHelper
