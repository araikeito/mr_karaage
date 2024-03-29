# frozen_string_literal: true

class CreateOverallAverages < ActiveRecord::Migration[5.2]
  def self.up
    create_table :overall_averages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.belongs_to :rateable, polymorphic: true
      t.float :overall_avg, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :overall_averages
  end
end
