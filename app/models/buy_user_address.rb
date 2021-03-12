class BuyUserAddress
    include ActiveModel::Model
    attr_accessor :address_number, :area_id, :ship_city, :ship_address, :ship_to_address, :telephone, :buy_user_id, :user_id, :item_id, :token

    with_options presence: true do
        validates :address_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
        validates :telephone, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
        validates :area_id, numericality: { other_than: 1 }
        validates :ship_city
        validates :ship_address
        validates :item_id
        validates :user_id
        validates :token
    end
    def save
       
        buy_user = BuyUser.create(item_id: item_id, user_id: user_id, token: token)
        
        Address.create(address_number: address_number, area_id: area_id, ship_city: ship_city, ship_address: ship_address, ship_to_address: ship_to_address, telephone: telephone, buy_user_id: buy_user.id)
    end
end