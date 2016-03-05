class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :title
      t.string :translation
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
