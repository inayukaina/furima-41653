class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'にはハイフン(-)を含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は --- 以外を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は半角数字(11桁)を使用してください' }
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
