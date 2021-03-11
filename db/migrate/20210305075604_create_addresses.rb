class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_number,  null: false
      t.integer :area_id,        null: false
      t.string :ship_city,       null: false
      t.string :ship_address,    null: false
      t.string :ship_to_address
      t.string :telephone,       null: false
      t.references :buy_user,     foreigen_key: true
      t.timestamps
    end
  end
end
