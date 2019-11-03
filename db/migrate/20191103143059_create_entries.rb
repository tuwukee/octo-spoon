class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.jsonb :content, nil: false, default: "{}"
      t.integer :total
      t.float :weight
      t.timestamps
    end
    add_index :entries, :content, using: :gin
  end
end
