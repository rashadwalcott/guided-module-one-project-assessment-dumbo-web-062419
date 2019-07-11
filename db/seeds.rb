#  [
#      "Cook-up Rice",
#      "Chicken Curry and Rice",
#      "Beef Curry and Rice",
#      "Duck Curry and Rice",
#      "Bake and Saltfish",
#      "Dhal and Rice",
#      "Bolanga and Rice",
#      "Chicken Fried Rice",
#      "Chicken Chowmein",
#      "Pepperpot",
#      "Fried Bora and Rice",
#      "Friend Plantain"

#  ].each do |name|
#      Dishes.create(name: name)
#      end

 r1 = Restaurant.create(name: "Patsy's Guyanese Cuisine")
 

 cust1 = Customer.create(name: "Ayana")
 cust2 = Customer.create(name: "Annie")
 cust3 = Customer.create(name: "Rashad")

 Dishes.create(name: "Curry CHicken",customer_id: cust1.id, restaurant_id: r1.id )
 Dishes.create(name: "Cookup rice", customer_id: cust2.id, restaurant_id: r1.id)#ionce customer chooses UPODATE this with cust ID
 Dishes.create(name: "Friend Plantain", customer_id: cust3.id, restaurant_id: r1.id)