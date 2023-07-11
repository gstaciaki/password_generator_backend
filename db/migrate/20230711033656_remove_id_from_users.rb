class RemoveIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :id
  end
end
