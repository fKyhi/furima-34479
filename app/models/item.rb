class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery


  with_options presence: true do
    validates :name
    validates :explain
    validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  #validates :user, foreign_key: true

end
