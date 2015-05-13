class RemoveIsfemaleToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :isfemale, :boolean
  end
end
