class AddIsfemaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isfemale, :boolean
  end
end
