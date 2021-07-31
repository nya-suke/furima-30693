class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :status, :shipping_fee, :prefecture, :scheduled_delivery
  has_many :users
  #has_one :user_item
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name, :information
    validates :price,inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id 
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
    validates :price, numericality: true

end



