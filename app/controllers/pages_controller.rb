class PagesController < ApplicationController

  def home

  end
  
  def topstories
    @stories = Story.top
  end

  def randomstories
  @stories = Story.random
  end
end
