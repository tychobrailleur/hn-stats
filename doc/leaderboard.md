The two major quality attributes of the system are:

- Performance: the system must be capable of providing updates in a real-time fashion;
- Scalable: the system must be capable of supporting thousand of users, and hundreds of thousands of games.

We can use several instances of rails, possibly using a load-balancer in front of these instances.  This will cater for the high number of users, the load-balancer ensuring that the users are distributed across the different rails instances.

To guarantee performance, we can use an in-memory store like Redis in front of our “actual” persistence database (for example MySQL, or postgresql).  The advantage of a solution like Redis is that the leaderboard can be maintained in a real-time fashion in-memory, making it quickly available to the rails instances.  Redis seems actually to be really appropriate for the leaderboard use case, see http://highscalability.com/blog/2011/7/6/11-common-web-use-cases-solved-in-redis.html.

Redis can also be used to scale the app by using master/slave replication.  The replication also positively affects high-availability, but has a negative impact on the “real-timeness“ of the application –  a benchmark might be needed to evaluate the tradeoff, and see what the optimal architecture is.  

Computing the scores of players can be delegated to an asynchronous message processing system like Resque or Sidekiq (the latter notoriously offering a higher throughput).  If running on JRuby, Sidekiq would actually deliver a higher performance, Celluloid (actor-based framework used by Sidekiq) benefiting from the JVM threading capability.  

See also:

- https://github.com/blog/542-introducing-resque
- https://github.com/mperham/sidekiq/wiki/FAQ
