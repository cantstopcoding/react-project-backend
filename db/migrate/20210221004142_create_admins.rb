class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :image_url

      t.timestamps
    end
  end
end
