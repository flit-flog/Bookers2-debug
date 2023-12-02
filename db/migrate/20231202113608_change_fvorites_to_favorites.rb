class ChangeFvoritesToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_table :fvorites, :favorites
  end
end
