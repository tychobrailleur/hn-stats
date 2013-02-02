### HN Stats

Rails application providing stats about HN entries.

Dev environment:
- JRuby 1.7.2
- MongoDB 2.2.2

### Hacker News Connection

There are a few gems to connect to Hacker News out there;
- https://github.com/bolthar/ruby-hackernews – scrapes HN screens to get the latest news with mechanize;
- https://github.com/seven1m/hackernews – also scrapes HN screens, but using regexps to extract info.

### Scheduled Task

### Stats Persistence

Using mongoid.  Stats are held in the `Stat` model, which also embeds the posts (`Post` model) used for the stats.


### TODO

- Delete active record stuff, as well as sqlite support.
- Fix issue with database_cleaner and mongoid.
