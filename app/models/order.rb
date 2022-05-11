class Order < ApplicationRecord
  extend FriendlyId
  friendly_id :random_slug, use: :slugged
  belongs_to :book


  private
    def random_slug
      [*'a'..'z',*'A'..'Z',*'0'..'9'].sample(10).join
    end
end
