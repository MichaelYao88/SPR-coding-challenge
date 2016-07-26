class Menu
	attr_reader :menu_items_array, :menu_item_ingredients_hash
	def initialize
		@menu_items_array = ["Coffee","Decaf Coffee","Caffe Latte", "Caffe Americano","Caffe Mocha","Cappuccino"].sort!

		coffee = {"coffee" => 3, "sugar" => 1, "cream"=>1}
		decaf_coffee = {"decaf coffee" => 3,"sugar" => 1, "cream" =>1}
		caffe_latte = {"espresso" => 2, "steamed Milk" => 1}
		caffe_americano = {"espresso" => 3}
		caffe_mocha = {"espresso" => 1, "cocoa" => 1, "steamed Milk" => 1, "whipped Cream" => 1}
		cappuccino = {"espresso" => 2, "steamed Milk" => 1, "foamed Milk" => 1}

		@menu_item_ingredients_hash = {"Coffee" => coffee ,"Decaf Coffee" => decaf_coffee, "Caffe Latte" => caffe_latte, "Caffe Americano" => caffe_americano, "Caffe Mocha" => caffe_mocha, "Cappuccino" => cappuccino}
	end

end
