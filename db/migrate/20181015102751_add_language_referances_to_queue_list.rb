class AddLanguageReferancesToQueueList < ActiveRecord::Migration[5.2]
  def change
    add_column :queue_lists, :language_from_id, :integer
    add_column :queue_lists, :language_to_id, :integer
  end
end
