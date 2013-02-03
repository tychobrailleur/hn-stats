describe HnNews do
  describe "#latest" do

    let(:posts) { double(:news) }

    it "calls latest, and return the posts" do
      HnApi::Client.stub_chain(:new, :latest).and_return(posts)
      Rails.logger.should_receive(:info).with("Retrieving latest info...")
      posts.should_receive(:items)

      HnNews.latest
    end
  end
end
