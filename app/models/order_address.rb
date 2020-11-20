class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number ,:prefectural_id ,:municipality ,:address ,:building_name ,:phone_number ,:user_id ,:item_id, :token

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefectural_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_number, numericality: :only_integer, length: { maximum: 11 }   
    validates :token
  end  
    
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_number: postal_number, prefectural_id: prefectural_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, order_id: order.id)
    end
end