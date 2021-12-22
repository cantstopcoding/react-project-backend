class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :image_url

      t.timestamps
    end
  end
end
