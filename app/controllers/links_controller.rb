class LinksController < ApplicationController
  def new
    
  end
  
  def create
    new_link
    base_url
    if !@link.errors.messages.empty?
      render "_link_errors.html.erb", layout: false
    else
      render "_link_list_item.html.erb", layout: false
    end
  end

  def redirect
    find_link
    if @link 
      @link.increment_access_count
      redirect_to short_url
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
  
  def index
    base_url
    top_link
  end

  private

  def short_url
    find_link
    @link.original_url
  end
  
  def base_url
    @base_url = URI(request.base_url).host
  end
  
  def new_link
    @link = Link.find_or_create_by(original_url: params["original_url"])
  end

  def find_link
    @link = Link.find(params[:token])
  end

  def top_link
    @links = Link.most_visited(limit)
  end

  def limit
    100
  end
end
