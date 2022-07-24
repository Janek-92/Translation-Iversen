class AddTrainingToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :training, :string
  end
end
