class CreateThreadStatuses < ActiveRecord::Migration
  def self.up
    create_table :thread_statuses do |t|
      t.boolean :is_master,     :null => false, :default => false
      t.integer :ping_count,    :null => false, :default => 0

      # optimistic locking - http://tinyurl.com/7vp9lj
      t.integer :lock_version,  :null => false, :default => 0

      t.timestamps
    end

    # speeds up search for latest master thread
    add_index :thread_statuses, :created_at
  end

  def self.down
    remove_index :thread_statuses, :created_at
    drop_table :thread_statuses
  end
end
