class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrate
      t.string :name
      t.integer :cellulose
    end
  end
end
