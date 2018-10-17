class CreateQueueLists < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    create_table :queue_lists, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.timestamps
    end
  end
end
