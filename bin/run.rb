require_relative '../config/environment'
require 'colorize'
require 'tty-prompt'
pid = fork{ exec 'afplay', 'La Bamba .mp3' }
reader = TTY::Reader.new
system 'clear'
@prompt = TTY::Prompt.new

puts "
OooOOo.                           Oo              .oOOOo.                                                      .oOOOo.                                 
O     `O                          oO             .O     o                                                     .O     o         o        o              
o      O          O                O             o                                                            o                                        
O     .o         oOo              o'             O                                                            o                                        
oOooOO'  .oOoO'   o   .oOo  O   o    .oOo        O   .oOOo O   o  O   o .oOoO' 'OoOo. .oOo. .oOo  .oOo.       o         O   o  O  .oOo  O  'OoOo. .oOo.
o        O   o    O   `Ooo. o   O    `Ooo.       o.      O o   O  o   O O   o   o   O OooO' `Ooo. OooO'       O         o   O  o  `Ooo. o   o   O OooO'
O        o   O    o       O O   o        O        O.    oO O   o  O   o o   O   O   o O         O O           `o     .o O   o  O      O O   O   o O    
o'       `OoO'o   `oO `OoO' `OoOO    `OoO'         `OooO'  `OoO'o `OoOO `OoO'o  o   O `OoO' `OoO' `OoO'        `OoooO'  `OoO'o o' `OoO' o'  o   O `OoO'
                                o                                     o                                                                                
                             OoO'                                  OoO'                                                                                ".green.on_red.bold

def welcome
    puts "What's Happening!!!".green
end


#Takes the user's input
def get_user_name
     @customer_name = @prompt.ask("Kindly Input Your Name") do |q|
     q.required true
     q.validate /\A\w+\Z/
     end
     verify_name
 end


#Creates the new customer
def new_customer
    @customer = Customer.create(name: @customer_name)
    puts "Thank you for joining.".green
end



#Logs the user in based on new or existing
def login
        if Customer.find_by(name: @customer_name) == nil
            @prompt.select ("Looks Like You Are New Here. Here Are Your Choices") do |menu|
                menu.choice "Join Us", -> { new_customer } 
                menu.choice "Exit",-> {exit_program}

                end
        else
             if Customer.find_by(name: @customer_name)
                puts "#{@customer_name} I See You Are An Existing Customer"
                @customer = Customer.find_by(name: @customer_name)
        end
    end
end



#Gives the user a chance to verify their name if incorrect
def verify_name
    @confirm_name = @prompt.yes? ("I'm sorry did you say #{@customer_name}?"), convert: :bool
    if @confirm_name == true
            login
    else
        @customer_name = @prompt.ask("What did you say your name was again?")
            login
    end
end

#Shows the menu of the dishes
def dishes_display
    @dish_chosen = @prompt.select("DISHES") do |menu|
        Dish.all.each do |dish|
            menu.choice dish.name   
        end #when chosen assign to the customer
    end
        size_choice
        confirm_dish
end
   

#Gives size options for dish
def size_choice
    @choice = @prompt.select('Awesome! Now what size would you like?') do |menu|
        menu.choice name: 'small'
        menu.choice name: 'medium', disabled: '(Out fuh de day)'
        menu.choice name: 'large'
    end
end



#Confirms the user's dish choice
def confirm_dish
    @confirm_customer_dish = @prompt.yes? ("Just to confirm that was a #{@choice} #{@dish_chosen}?"), convert: :bool
        if @confirm_customer_dish == true
            #this is where i work with the ID
            other_options
        else
            puts "I'm very sorry about that. What was your order again?".red
            dishes_display
        
        end
end

#Gives more options
def other_options
    @prompt.select("Would you like to edit your account?") do |menu|
        menu.choice "Yes", -> {options_menu}
        menu.choice "No", -> {dish_price}
    end
end

#Menu solely for editing account
def options_menu
    @prompt.select("What would you like to do?") do |menu|
        menu.choice "Edit Name", -> {update_name}
        menu.choice "Delete Account", -> {delete_customer}
    end
end
#Sets the price of the dish
def dish_price
    if @choice == "small"
        price = 10
    else
        price = 15
    end
    puts "Great! Your total is $#{price}. CASH ONLY".yellow
    puts " Thank you for your business #{@customer.name}!".green
end

#Helper method to delete customer
def destroy_self
    goodbye = Customer.find_by(name: @customer.name)
    
    goodbye.destroy

     end

 #Deletes customer out of the database
 def delete_customer
    @prompt.select ("Are you sure you want to delete your account?") do |menu|
    menu.choice "Yes", -> {destroy_self}
    menu.choice "No", -> {restaurant_interface}
    end
     puts "Thank you for your business. Your account is now deleted".green
 end
 
 #Gives the user a chance to update their name
 def update_name
    updated_name = @prompt.ask("What will you like to change it to?") do |q|
        q.required true
        q.validate /\A\w+\Z/
    end
    @customer.update(name: updated_name )
    restaurant_interface
 end

 def exit_program
    exit
 end
 


def restaurant_interface
    @prompt.select("What Will You Like To Do") do |menu|
        menu.choice "Choose a Dish", -> { dishes_display}
        menu.choice "Update Name", -> {update_name}
        menu.choice "Delete Account", -> { delete_customer}
        menu.choice "Exit", -> {exit_program}
    end
end




def run
    welcome
    system 'clear'
    puts "
    OooOOo.                           Oo              .oOOOo.                                                      .oOOOo.                                 
    O     `O                          oO             .O     o                                                     .O     o         o        o              
    o      O          O                O             o                                                            o                                        
    O     .o         oOo              o'             O                                                            o                                        
    oOooOO'  .oOoO'   o   .oOo  O   o    .oOo        O   .oOOo O   o  O   o .oOoO' 'OoOo. .oOo. .oOo  .oOo.       o         O   o  O  .oOo  O  'OoOo. .oOo.
    o        O   o    O   `Ooo. o   O    `Ooo.       o.      O o   O  o   O O   o   o   O OooO' `Ooo. OooO'       O         o   O  o  `Ooo. o   o   O OooO'
    O        o   O    o       O O   o        O        O.    oO O   o  O   o o   O   O   o O         O O           `o     .o O   o  O      O O   O   o O    
    o'       `OoO'o   `oO `OoO' `OoOO    `OoO'         `OooO'  `OoO'o `OoOO `OoO'o  o   O `OoO' `OoO' `OoO'        `OoooO'  `OoO'o o' `OoO' o'  o   O `OoO'
                                    o                                     o                                                                                
                                 OoO'                                  OoO'                                                                                ".green.on_red.bold
    get_user_name
    restaurant_interface
    pid = fork{ exec 'killall', 'afplay' }
end
run
