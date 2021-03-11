FactoryBot.define do
  factory :buy_user_address do
      address_number {"111-1111"}
      area_id {4}
      ship_city {"松本市"}
      ship_address {"寿台５−３−１"}
      ship_to_address {"ハイツ３０９"}
      telephone {"09012345678"}
      item_id {1}
      user_id {1}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
