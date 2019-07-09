%w(Cindy Sabi Monica Naiomi Amrit Aliciea Aleks Laurell).each do |name|
Customer.create(name: name)
end

[
    "Cookup Rice",
    "Curry Chicken", 
    "Curry Beef",
    "Bake and Saltfish",
    "Curry Duck",
    "Bolanga",
    "Fried Rice",
    "Chowmein"
].each do |name|
    Dishes.create(name: name)
    end

    [
        "Guyana's Tastiness Location 1",
        "Guyana's Tastiness Location 2",
        "Guyana's Tastiness Location 3"
].each do |name|
    Restaurant.create(name: name)
    end