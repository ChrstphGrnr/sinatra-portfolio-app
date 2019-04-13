class AddImageToTrailsTable < ActiveRecord::Migration
  def change
    add_column :trails, :image, :string
  end
end
