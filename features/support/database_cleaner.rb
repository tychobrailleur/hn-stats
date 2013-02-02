begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

# TODO figure out why database cleaner is not working.
# For the moment rake db:seed RAILS_ENV=test
#  DatabaseCleaner[:mongoid].strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
#  DatabaseCleaner.start
end

After do |scenario|
#  DatabaseCleaner.clean
end
