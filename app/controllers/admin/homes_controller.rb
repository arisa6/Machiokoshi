class Admin::HomesController < ApplicationController
  def top
    @items = Item.all
    # @items = Item.limit(4).order("created_at DESC")
  end
end
