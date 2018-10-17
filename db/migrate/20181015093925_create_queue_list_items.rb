class CreateQueueListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :queue_list_items do |t|
      t.uuid :queue_list_id
      t.references :translation, index: true, foreign_key: true
      t.timestamps
    end
  end
end
