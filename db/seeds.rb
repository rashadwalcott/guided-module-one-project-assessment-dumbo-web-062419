 [
     "Cook-up Rice",
     "Chicken Curry and Rice",
     "Beef Curry and Rice",
     "Duck Curry and Rice",
     "Bake and Saltfish",
     "Dhal and Rice",
     "Bolanga and Rice",
     "Chicken Fried Rice",
     "Chicken Chowmein",
     "Pepperpot",
     "Fried Bora and Rice",
     "Friend Plantain"

 ].each do |name|
     Dishes.create(name: name)
     end

 Restaurant.create(name: "Patsy's Guyanese Cuisine")