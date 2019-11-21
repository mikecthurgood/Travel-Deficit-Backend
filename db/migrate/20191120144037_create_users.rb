class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.bigint :fb_id
      t.integer :age

      t.timestamps
    end
  end
end
