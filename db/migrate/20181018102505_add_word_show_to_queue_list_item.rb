class AddWordShowToQueueListItem < ActiveRecord::Migration[5.2]
  def change
    add_column :queue_list_items, :word_show, :boolean
  end
end
