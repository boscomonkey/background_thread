require 'fastthread'

class ThreadBureaucrat
  def self.retry_threshold
    3
  end
  
  def self.sleep_duration
    5
  end
  
  def self.takeover_threshold
    sleep_duration * retry_threshold
  end
  
  def initialize
    @status = ThreadStatus.new
    refresh_status
    @retry = 0
    @thred = nil
  end
  
  def handle
    @status.id
  end
  
  def run(&func)
    step &func # run once to raise exceptions (if any)
    
    @thred = Thread.new do
      begin
        while true
          sleep ThreadBureaucrat.sleep_duration
          step &func
        end
      ensure
        stop
      end
    end
  end
  
  def step(&func)
    if @status.is_master
      refresh_status
      func.call if func
    else
      recent_masters = find_recent_masters
      if recent_masters.any?
        @retry = 0
        refresh_status
      else
        @retry += 1
        if @retry > ThreadBureaucrat.retry_threshold
          @status.is_master = true
          refresh_status
          func.call if func
          @retry = 0
        end
      end
    end
  end
  
  def stop
    @thred.kill if @thred
    @status.is_master = false
    refresh_status
  end
  
  private
  
  def find_recent_masters
    ThreadStatus.recent_masters ThreadBureaucrat.takeover_threshold
  end
  
  def refresh_status
    @status.ping
    @status.save
  end
end