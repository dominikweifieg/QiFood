module BooksHelper
  def authors(book)
    first = true
    text = ""
	  book.linked_authors.each do |author|
		  text += ", " unless first
		  text += link_to( author.first_name + " " + author.name, author)
		  first = false
	  end
	  logger.error("|#{book.authors}|")
	  unless book.authors.blank?
	    text += ", " unless first
	    text += book.authors
    end
    content_tag(:span, :class=> "authors") do
      text
	  end
  end
end
