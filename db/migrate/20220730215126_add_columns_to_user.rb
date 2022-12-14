class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :location, :string
    add_column :users, :about, :text
    add_column :users, :status, :boolean, default: false
    add_column :users, :language, :string
  end
end
