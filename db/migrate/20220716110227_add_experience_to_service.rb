class AddExperienceToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :experience, :text
  end
end
