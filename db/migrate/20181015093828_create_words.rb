class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name

      t.references :language, index: true, foreign_key: true
      t.timestamps
    end
  end
end
