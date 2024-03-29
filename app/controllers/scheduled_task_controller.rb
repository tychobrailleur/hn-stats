require 'json'

# Quite debatable whether the scheduled task should be a controller
class ScheduledTaskController < ApplicationController

  # retrieves the news, calculates stats, and stores them.
  def execute!
    latest = HnNews.latest
    stats = compute_stats(latest)
    store_stats(stats, latest)
    NewsMailer.update_email(Stat.last)
  end

  def compute_stats(news)
    [:average, :median, :mode].map do |calc| 
      Statistics.send(calc, news, :points)
    end
  end

  def store_stats(stats, latest)
    stat = Stat.new(average: stats[0], median: stats[1], mode: stats[2])
    stat.posts = above_median(latest, stats[1])

    stat.save!
  end

  def above_median(latest, median)
    latest.select { |n| n.points > median }.map do |n| 
      Post.new(title: n.title, url: n.url, id: n.id, points: n.points)
    end
  end
end
