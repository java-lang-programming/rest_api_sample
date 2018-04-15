class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.string :profile_image
      t.integer :gender
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
