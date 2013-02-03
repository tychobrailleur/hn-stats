require "spec_helper"

describe NewsMailer do
  describe "update email" do

    let (:stats) { mock(:stat) }
    subject { NewsMailer.update_email(stats) }

    # For some reason, the mocks cannot be used in a before(:all) block.
    def mock_calls
      posts = mock(:post)

      stats.should_receive(:average)
      stats.should_receive(:median)
      stats.should_receive(:mode)
      stats.should_receive(:posts).and_return(posts)
      posts.should_receive(:each)
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
