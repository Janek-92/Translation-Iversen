class AddTrainingToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :training, :text
  end
end
