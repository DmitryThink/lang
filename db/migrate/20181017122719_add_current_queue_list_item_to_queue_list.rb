class AddCurrentQueueListItemToQueueList < ActiveRecord::Migration[5.2]
  def change
    add_column :queue_lists, :current_queue_list_item_id, :integer
  end
end
