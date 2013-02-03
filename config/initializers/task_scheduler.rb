require 'rubygems'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

tasker = ScheduledTaskController.new

scheduler.every("2m") do
  tasker.execute!
end
