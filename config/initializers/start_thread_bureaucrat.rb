=begin
=end
Thread.new do
  # wait before firing up the ThreadBureaucrat so that rake jobs can
  # run without needing a database in place.
  sleep 60

  counter = 0
  ctrl = ThreadBureaucrat.new
  ctrl.run {
    RAILS_DEFAULT_LOGGER.info("-------- #{counter} --------")
    counter += 1
  }
end
