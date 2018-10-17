class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.timestamps
    end
    add_column :translations, :language_from_id, :integer
    add_column :translations, :language_to_id, :integer
    add_column :translations, :word_from_id, :integer
    add_column :translations, :word_to_id, :integer
  end
end
