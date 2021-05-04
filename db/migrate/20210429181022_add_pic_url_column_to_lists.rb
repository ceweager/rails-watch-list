class AddPicUrlColumnToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :pic_url, :string
  end
end
