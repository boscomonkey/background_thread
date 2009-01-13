class ThreadStatus < ActiveRecord::Base
  named_scope :default_index, :order => "created_at DESC"
  
  named_scope :recent_masters, lambda {|*args|
    {
      :conditions => ["is_master = ? AND updated_at > ?", true,
       (args.first || 60).seconds.ago],
      :order => "created_at DESC",
      :limit => 1
    }
  }
  
  named_scope :recent_updated, lambda {|*args|
    {
      :conditions => ["updated_at > ?", (args.first || 60).seconds.ago],
      :order => "created_at DESC"
    }
  }
  
  def ping
    self.ping_count += 1
  end
end
