class PagesController < ApplicationController
  def topstories
    @stories = Story.top
  end

  def randomstories
  @stories = Story.random
  end
end
