class Link
  include Mongoid::Document
    field :original_url, type: String
    field :short_url, type: String
    field :access_count, type: Integer, default: 0
    after_initialize :create_short_extension
    validates_format_of :original_url, with: URI.regexp
    validates_uniqueness_of :original_url
    validates_uniqueness_of :short_url
    
  def create_short_extension
    if !self.short_url
      self.short_url = (0...8).map { (65 + rand(26)).chr }.join
    end
  end

  def shortened_url(base_url)
    "#{base_url}/l/#{short_url}"
  end

  def increment_access_count
    self.access_count = access_count + 1
    self.save!
  end

  def domain
    puts original_url
    URI(original_url).host if original_url
  end
  
  def all_attributes(base_url)
    self.attributes.merge({"shortened_url" => shortened_url(base_url)})
  end
end
