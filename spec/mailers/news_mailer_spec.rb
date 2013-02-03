require "spec_helper"

describe NewsMailer do
  describe "update email" do

    let (:stats) { mock("stats") }
    let (:items) { mock("items") }
    subject { NewsMailer.update_email(stats, items) }

    # For some reason, the mocks cannot be used in a before(:all) block.
    def mock_calls
      stats.should_receive(:[]).exactly(3).times
      items.should_receive(:each)
    end

    it "defines a proper subject" do
      mock_calls
      subject.subject.should eq("[HnStats] Latest News")
    end

    it "sends the subject to the correct recipient" do
      mock_calls
      subject.to.first.should eq("sebastien@weblogism.com")
    end

    it "comes from me" do
      mock_calls
      subject.from.first.should eq("sebastien@weblogism.com")
    end

  end

end
