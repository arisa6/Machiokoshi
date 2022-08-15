class AddStoreToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :store, :string
  end
end
