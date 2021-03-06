# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def self.up
    create_table :rates, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, polymorphic: true
      t.float :stars, null: false
      t.string :dimension
      t.timestamps
    end
    end

  def self.down
    drop_table :rates
  end
end
