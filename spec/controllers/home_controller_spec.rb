require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders the home view" do
      get 'index'
      response.should render_template("home/index")
    end

    describe "Get the latest stats" do
      before(:each) do
        Stat.stub(:last).and_return(:foo)
        get 'index'
      end

      it { should assign_to(:stat).with(:foo) } 
    end
  end
end
