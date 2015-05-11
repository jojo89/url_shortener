class Link
  include Mongoid::Document
  include Mongoid::Token
    field :original_url, type: String
    field :access_count, type: Integer, default: 0
    token alphanumeric: true 
    validates_format_of :original_url, with: URI.regexp
    validates_uniqueness_of :original_url

  def self.most_visited(limit)
    order_by(access_count: 'desc').limit(limit).to_a
  end

  def shortened_url(base_url)
    "#{base_url}/l/#{token}"
  end

  def increment_access_count
    self.access_count = access_count + 1
    self.save!
  end

  private

  def domain
    URI(original_url).host if original_url
  end
end
