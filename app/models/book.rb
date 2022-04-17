class Book < ApplicationRecord

    validates :name , presence: true , uniqueness: true
    validates :date , presence: true
    validates :price , numericality: {greater_than: 0}
    validates :pages , numericality: {greater_than: 0}
    validates :ISBN , presence: true , uniqueness: true, length: {minimum:10}
end
