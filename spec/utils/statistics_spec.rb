require 'spec_helper'

describe Statistics do
  # Dummy class used for testing.
  class Dummy
    attr_reader :a, :b

    def initialize(a, b)
      @a, @b = a, b
    end
  end

  subject (:array) { [Dummy.new(2, "a"), Dummy.new(5, "b"), Dummy.new(3, "c"), Dummy.new(2, "d") ] }

  it "calculates the sum" do
    Statistics.sum(array, :a).should == 12.0
  end

  it "calculates the average" do
    Statistics.average(array, :a).should == 3.0
  end

  it "calculates the median for even numbers" do
    Statistics.median(array, :a).should == 2.5
  end

  it "calculates the median for odd numbers" do
    odd_size_array = array.clone + [Dummy.new(4, "e")]
    Statistics.median(odd_size_array, :a).should == 3.0
  end

  it "calculates the mode" do
     Statistics.mode(array, :a).should == 2.0
  end
end
