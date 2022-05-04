class Book < ApplicationRecord

    extend FriendlyId
    friendly_id :random_slug, use: :slugged

    validates :name , presence: true , uniqueness: true
    validates :date , presence: true
    validates :price , numericality: {greater_than: 0}
    validates :pages , numericality: {greater_than: 0}
    validates :ISBN , presence: true , uniqueness: true, length: {minimum:10}

    private

    def random_slug
        [*'a'..'z',*'A'..'Z',*'0'..'9'].sample(10).join
    end
end
