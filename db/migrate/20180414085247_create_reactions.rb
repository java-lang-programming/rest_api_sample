class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.integer :kind
      t.string :name
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
