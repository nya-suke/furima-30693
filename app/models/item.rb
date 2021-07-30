class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :status, :shipping_fee, :prefecture, :scheduled_delivery
  has_many :users
  has_one :user_item
  has_one_attached :image
    validates :image, presence: true
    #空の投稿を保存できないようにする
    validates :name, :information, :price,   presence: true

      #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates_inclusion_of :price, in:300..9999999

end
