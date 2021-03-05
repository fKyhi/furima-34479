class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :addressed, :building, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addressed
    validates :phone_number, numericality: {with: /\A\d{11}\z/}
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addressed: addressed, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end