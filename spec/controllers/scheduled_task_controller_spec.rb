require 'spec_helper'

# This should probable be factory-girl'd
class DummyNews
  attr_reader :title, :url, :id, :points
  def initialize(title, url, id, points)
    @title, @url, @id, @points = title, url, id, points
  end
end


describe ScheduledTaskController do

  subject { ScheduledTaskController.new } 

  describe "Get HN News" do

    it "calls latest" do
      HnNews.should_receive(:latest).and_return(:foo)
      subject.should_receive(:compute_stats).with(:foo).and_return(:bar)
      subject.should_receive(:store_stats).with(:bar, :foo)
      
      subject.execute!
    end
  end

  describe "#compute_stats" do
    let(:news) { double(:news) }

    it "calculates median" do
      Statistics.should_receive(:average).with(news, :points).and_return(1.0)
      Statistics.should_receive(:median).with(news, :points).and_return(2.0)
      Statistics.should_receive(:mode).with(news, :points).and_return(3.0)
      result = subject.compute_stats(news)
      result.should eq([1.0, 2.0, 3.0])
    end
  end

  describe "#store_stats" do
    let(:foobar) { double(:stat) }
    let(:item) { [DummyNews.new("blah", "http://example.org", 1, 42.0),
                  DummyNews.new("bloh", "http://example.org", 2, 1.0)] }

    it "saves the stats" do

      saved_news = nil
      Stat.should_receive(:new).with(average: 1.0, median: 2.0, mode: 3.0).and_return(foobar)
      foobar.should_receive(:posts=) do |arg|
        saved_news = arg
      end
      foobar.should_receive(:save!)
      
      subject.store_stats([1.0, 2.0, 3.0], item)
      saved_news.length.should == 1
      saved_news.first.title.should eq("blah")
      saved_news.first.url.should eq("http://example.org")
      saved_news.first.points.should eq(42.0)
    end
  end
  
end
