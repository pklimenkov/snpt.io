class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :token
      t.text :url

      t.timestamps
    end

    add_index :links, :token, unique: true
  end
end
