# Test data seeding

stat = Stat.new(average: 10, median: 42, mode: 34.5)
post_1 =  Post.new(title: "First", url: "http://example.org", id: 42, points: 45)
post_2 =  Post.new(title: "Second", url: "http://example.org", id: 23, points: 4)

stat.posts = [ post_1, post_2 ]
stat.save!
