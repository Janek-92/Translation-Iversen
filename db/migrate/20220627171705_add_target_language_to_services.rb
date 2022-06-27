class AddTargetLanguageToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :target_language, :string
  end
end
