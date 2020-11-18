class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number ,:prefectural ,:municipality ,:address ,:building_name ,:phone_number

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefectural, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  end  
    
    def save
      Order.create(user: user, address: address)
      Address.create(postal_number: postal_number, prefectural: prefectural, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name)
    end
end