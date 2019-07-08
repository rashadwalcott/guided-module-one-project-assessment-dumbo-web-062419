class Restaurant < ActiveRecord::Base
has_many :customers, through: :dishes
has_many :dishes

@@all = []

def initialize
    @@all << self
end







end