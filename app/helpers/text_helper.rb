module TextHelper

  def safe_truncate(text, options = {:length => 30}, ellipsis = "...")
    return if text.nil?
    
    length = options[:length] - ellipsis.length    
    
    return text if text.length < length
    
    logger.error { "text: #{text}, length: #{length}" }
    return strip_tags(text).scan(/&#?[^\W_]+;|./).first(length).join + ellipsis
  end

end
