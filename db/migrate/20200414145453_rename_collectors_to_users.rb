class RenameCollectorsToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :collectors, :users
  end
end
