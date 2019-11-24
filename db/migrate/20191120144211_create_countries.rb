class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :description
      t.string :climate
      t.string :continent
      t.string :terrain
      t.bigint :population

      t.timestamps
    end
  end
end
