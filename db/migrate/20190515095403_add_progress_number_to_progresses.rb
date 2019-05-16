class AddProgressNumberToProgresses < ActiveRecord::Migration[5.2]
  def change
    add_column :progresses, :progress_number, :string
  end
end
