require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

	Before do 
  	DatabaseCleaner.start
  end

  After do 
  	DatabaseCleaner.clean
  end