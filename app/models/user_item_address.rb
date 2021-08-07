class UserItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number
    validates :token
  end
  validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :phone_number, format: {with: /\A[0-9]+\z/, message:'is invalid. Input only number'}
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is too short'}


    def save
      user_item = UserItem.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, user_item_id: user_item.id)
    end
end