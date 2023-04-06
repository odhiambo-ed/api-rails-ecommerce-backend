class Product < ApplicationRecord
    has_and_belongs_to_many :customers
    has_many :colors
    has_many :images
    has_many :sizes
end
