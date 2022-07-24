class RemoveTrainingFromService < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :training, :string
  end
end
