# frozen_string_literal: true

class ChangeDatatypePhoneNumberOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number, :string
  end
end
