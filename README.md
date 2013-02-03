### HN Stats

Rails application providing stats about HN entries.  

The application starts a scheduled task that periodically retrieves posts from api.ihackernews.com (using a custom gem, http://github.com/tychobrailleur/hn-api), calculates statistical values from them, and stores them into a MongoDB database using mongoid.  The latest statistical values can be read from the home page (http://localhost:3000).  Yes, this implementation is completely overkill, but it showcases a broad range of technics.

Dev environment:
- JRuby 1.7.2
- MongoDB 2.2.2

### Hacker News Connection

There are a few gems to connect to Hacker News out there;
- https://github.com/bolthar/ruby-hackernews – scrapes HN screens to get the latest news with mechanize;
- https://github.com/seven1m/hackernews – also scrapes HN screens, but using regexps to extract info.

As I want to connect to api.ihackernews.com rather than doing screen scraping, I have written my own gem, http://github.com/tychobrailleur/hn-api.  As RubyGems are currently read-only, I cannot release it yet.

### Scheduled Task

See https://www.ruby-toolbox.com/categories/scheduling



### Stats Persistence

Using mongoid.  Stats are held in the `Stat` model, which also embeds the posts (`Post` model) used for the stats.

### Mocking Web Service

I am using a mocked version of the api to avoid hammering the real site when testing. This mocked service is a Sinatra app that returns a static version of the HN API output.


### TODO

- Proper error handling.
- Delete active record stuff, as well as sqlite support.
- Fix issue with database_cleaner and mongoid.
- Extend for multi-modal samples (i.e. samples with mode with multiple values).
