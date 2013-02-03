require 'rubygems'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

# Override client URI to use mock server.
# HnApi::Client::URI = "http://localhost:4567"

tasker = ScheduledTaskController.new

scheduler.every("10m") do
  tasker.execute!
end
