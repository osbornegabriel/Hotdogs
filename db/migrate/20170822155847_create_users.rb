class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |hotdog|
      hotdog.string :name, null: false
      hotdog.string :email, null: false, unique: true
      hotdog.string :hotdog_pw_hash, null: false

      hotdog.timestamps
    end
  end
end
