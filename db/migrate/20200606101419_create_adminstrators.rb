class CreateAdminstrators < ActiveRecord::Migration[6.0]
  def change
    create_table :adminstrators do |t|
      t.string :email
      t.string :hashed_password
      t.boolean :suspended
      t.timestamps
    end
    add_index :adminstrators, "LOWER(email)", unique: true
  end
end
