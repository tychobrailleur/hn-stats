class HomeController < ApplicationController
  def index
    @stat = Stat.last
  end
end
