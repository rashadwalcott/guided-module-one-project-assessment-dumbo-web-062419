class Restaurant < ActiveRecord::Base
has_many :customers, through: :dishes
has_many :dishes








end