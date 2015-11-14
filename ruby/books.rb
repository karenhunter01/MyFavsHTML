class Books #{

	#attr_accessor :author, :title
	attr_reader :author_fname, :author_lname, :title

	def author_fname=(name)
		if name == ""
			puts "Warning: Author First Name cannot be blank"
		end
		@author_fname=name
	end

	def author_lname=(name)
		if name == ""
			raise "Fatal Error: Author Last Name cannot be blank"
		end
		@author_lname=name
	end

	def title=(name)
		if name == ""
			raise "Fatal Error: Book Title cannot be blank"
		end
		@title = name
	end

	def displayAuthor
		puts "Author: #{@author_lname}, #{@author_fname}"
	end

	def displayTitle
		puts "Title: #{@title}"
	end

	def displayTitleAndAuthor
		r1 = displayAuthor.to_s.chomp
		r1 = r1.concat(displayTitle.to_s).chomp
		p r1 
	end
end #}


class Romance_Books  < Books
end


class Fantasy_Books  < Books
end

rom1=Romance_Books.new
rom1.author_fname="Linda"
rom1.author_lname="Howard"
rom1.title="Almost Home"
#rom1.displayTitleAndAuthor
puts rom1.author_lname + ", " + rom1.author_fname + ": " + rom1.title
