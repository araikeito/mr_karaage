class AddMaterialImageIdToProgresses < ActiveRecord::Migration[5.2]
  def change
    add_column :progresses, :material_image_id, :string
  end
end
