class StaticPagesController < ApplicationController
  def home
    render layout: "landing"
  end

  def docs
  end
end
