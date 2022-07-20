class AddYearsOfExperienceToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :years_of_experience, :integer
  end
end
