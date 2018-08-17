class AddOptionsToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :options, :jsonb, default: {}
  end
end
