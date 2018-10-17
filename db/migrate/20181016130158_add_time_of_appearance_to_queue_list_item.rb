class AddTimeOfAppearanceToQueueListItem < ActiveRecord::Migration[5.2]
  def change
    add_column :queue_list_items, :time_of_appearance, :datetime
    add_column :queue_list_items, :index_of_time, :integer, default: 0
  end
end
