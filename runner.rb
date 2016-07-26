require_relative 'inventory'

def run
	@inventory.display
	message = ""
	while message == ""
		message = gets.chomp.downcase
	end
	parse(message)
end


def parse(message)
	# I could've used regex here but I think it works either way
	if [1,2,3,4,5,6].include?(message.to_i)
		@inventory.order(message.to_i)
	else
		case message.downcase
		when "r"
			@inventory.restock
		when "q"
			abort("Thank you, come again")
		else
			puts "Invalid selection: " + message
		end
	end
	run
end

@inventory = Inventory.new
run
