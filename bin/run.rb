require_relative '../config/environment'
require 'tty-prompt'
reader = TTY::Reader.new
system 'clear'
@prompt = TTY::Prompt.new

puts "OooOOo.                           Oo              .oOOOo.                                                      .oOOOo.                                 
O     `O                          oO             .O     o                                                     .O     o         o        o              
o      O          O                O             o                                                            o                                        
O     .o         oOo              o'             O                                                            o                                        
oOooOO'  .oOoO'   o   .oOo  O   o    .oOo        O   .oOOo O   o  O   o .oOoO' 'OoOo. .oOo. .oOo  .oOo.       o         O   o  O  .oOo  O  'OoOo. .oOo.
o        O   o    O   `Ooo. o   O    `Ooo.       o.      O o   O  o   O O   o   o   O OooO' `Ooo. OooO'       O         o   O  o  `Ooo. o   o   O OooO'
O        o   O    o       O O   o        O        O.    oO O   o  O   o o   O   O   o O         O O           `o     .o O   o  O      O O   O   o O    
o'       `OoO'o   `oO `OoO' `OoOO    `OoO'         `OooO'  `OoO'o `OoOO `OoO'o  o   O `OoO' `OoO' `OoO'        `OoooO'  `OoO'o o' `OoO' o'  o   O `OoO'
                                o                                     o                                                                                
                             OoO'                                  OoO'                                                                                "

def welcome
    puts "Welcome!!! Come on in!" 
end

def customer_login
    @user_input = @prompt.ask("What is your name?")do |q|
    q.required true
    q.validate /\A\w+\Z/
    end
end


def create_name
    if Customer.find_by(name: @user_input) == nil
         Customer.create(name: @user_input)#assign to a variable
             puts "Hi! #{@user_input}. Here are your choices please order when you are ready!"
    else
            puts "Welcome back #{@user_input} What would you like today?"
        end
    end


def verify_name
    @confirm_name = @prompt.yes? ("I'm sorry did you say #{@user_input}?"), convert: :bool
    if @confirm_name == true
        create_name
    else
        @user_input = @prompt.ask("What did you say your name was again?")
        create_name
    end
end


def dishes_display
    @dish_chosen = @prompt.select("MENU CHOICES") do |menu|
        Dishes.all.each do |dish|
            menu.choice dish.name
            
        end #when chosen assign to the customer
    end
end
   
def size_choice
    @choice = @prompt.select('Awesome! Now what size would you like?') do |menu|
        menu.choice name: 'small'
        menu.choice name: 'medium', disabled: '(Out fuh de day)'
        menu.choice name: 'large'
    end
end

def confirm_dish
    @confirm_customer_dish = @prompt.yes? ("Just to confirm that was a #{@choice} #{@dish_chosen}?"), convert: :bool
        if @confirm_customer_dish == false
            puts "I'm very sorry about that. What was your order again?"
        dishes_display
        size_choice
        else
            dish_price
        
        end
end

def dish_price
    if @choice == "small"
        price = 10
    else
        price = 15
    end
    
    puts "Great! Your total is $#{price}"
end

def run
welcome
customer_login
verify_name
dishes_display
size_choice
confirm_dish
end
run





 