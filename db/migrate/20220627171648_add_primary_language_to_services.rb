class AddPrimaryLanguageToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :primary_language, :string
  end
end
