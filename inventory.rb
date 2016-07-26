require_relative 'menu'
class Inventory
  #If I put more time into this I'd probably have separated the item prices into their own class to make this more organized
  #I could have made this a bit more readable using arrays but I wanted this run in n time instead of iterating on nested arrays so I used hashes


  def initialize
    @ingredient_inventory_hash = {}
    @ingredient_price_hash = {}
    # I read the alphabetized portion after finishing so I added sort! after.
    @ingredients_array = ["cocoa","coffee","cream","decaf coffee","espresso","foamed Milk","steamed Milk","sugar","whipped Cream"].sort!
    # I could (and should) manually enter in these hash values instead of iterating them in while initializing
    price_array = [0.90,0.75,0.25,0.75,1.10,0.35,0.35,0.25,1.00]
    @ingredients_array.each_with_index do |item,y|
    	@ingredient_inventory_hash[item] = 10
    	@ingredient_price_hash[item] = price_array[y]	
    end
    @menu = Menu.new()
  end

  def restock
  	@ingredients_array.each do |item|
    	@ingredient_inventory_hash[item] = 10
    end
  end

  def display
  	puts ""
  	puts "Inventory:"
  	@ingredient_inventory_hash.each do |item, amount|
  		puts item.capitalize + ", " + amount.to_s
  	end
  	puts ""
  	puts "Menu:"
  	@menu.menu_items_array.each_with_index do |item, y|
  		puts (y+1).to_s + "." + item + ", "  + format("$%.2f",price(item)).to_s + ", " + in_stock?(item).to_s
  	end
  end

  def price(item)
  	sum = 0
  	ingredients_hash = @menu.menu_item_ingredients_hash[item]
  	ingredients_hash.each do |key, value|
  		sum = sum + @ingredient_price_hash[key]*value
  	end
  	return sum
  end

  def in_stock?(item)
  	ingredients_hash = @menu.menu_item_ingredients_hash[item]

  	ingredients_hash.each do |key, value|
  		if @ingredient_inventory_hash[key] >= value
  			return true
  		else
  			return false
  		end
  	end
  end

  def order(number)
  	item = @menu.menu_items_array[number-1]
  	if in_stock?(item)
  		puts "Dispensing: " + item
  		
  		ingredients_hash = @menu.menu_item_ingredients_hash[item]
	  	
	  	ingredients_hash.each do |key, value|
	  		@ingredient_inventory_hash[key] -= value
	  	end
	else
		puts "Out of Stock: " + item
	end
end
end
