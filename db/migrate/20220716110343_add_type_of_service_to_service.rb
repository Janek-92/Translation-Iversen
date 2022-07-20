class AddTypeOfServiceToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :type_of_service, :string
  end
end
