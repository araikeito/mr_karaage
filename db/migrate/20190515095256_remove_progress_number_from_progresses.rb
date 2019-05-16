class RemoveProgressNumberFromProgresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :progresses, :progress_number, :integer
  end
end
