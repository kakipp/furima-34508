class CreateBuyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_users do |t|
      t.references :user,  foreigen_key: true
      t.references :item,  foreigen_key: true
      t.timestamps
    end
  end
end
