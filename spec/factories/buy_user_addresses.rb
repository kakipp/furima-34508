FactoryBot.define do
  factory :buy_user_address do
      address_number {"111-1111"}
      area_id {4}
      ship_city {"松本市"}
      ship_address {"寿台５−３−１"}
      ship_to_address {"ハイツ３０９"}
      telephone {"09012345678"}
      token {"tok_abcdefghijk00000000000000000"}
      item_id {FactoryBot.create(:item).id}
      user_id {FactoryBot.create(:user).id}
      
  end
end
