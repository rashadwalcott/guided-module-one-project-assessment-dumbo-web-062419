class Customer < ActiveRecord::Base
    has_many :dishes
    has_many :restaurants, through: :dishes



end