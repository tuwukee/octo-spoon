class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.integer :total
      t.float :weight
      t.date :title
      t.boolean :cycle, default: false
      t.timestamps
    end

    remove_column :entries, :weight, :float
    add_column :entries, :day_id, :bigint, index: true
    add_column :entries, :type, :string
    add_column :entries, :time, :time
  end
end
