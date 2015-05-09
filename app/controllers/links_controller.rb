class LinksController < ApplicationController
  def new
    
  end
  
  def create
    new_link
    render "_link_list_item.html.erb", layout: false
  end

  def redirect
    find_link
    @link.increment_access_count
    redirect_to short_url
  end
  
  def index
    top_link
  end

  private

  def short_url
    find_link
    @link.original_url
  end
  
  def new_link
    @link = Link.find_or_create_by(original_url: params["original_url"])
  end

  def find_link
    @link = Link.find_by(short_url: params[:sha])
  end

  def top_link
    @links = Link.order_by(:access_count => 'desc').limit(100).to_a
  end
end
