def random_string
  (0...8).map { (65 + rand(26)).chr }.join
end

def random_domain
  random_string + %w(.io .com .net .gov).sample
end

def random_extension
  "/#{random_string}"
end

def random_url
  "http://" + random_domain + random_extension
end

FactoryGirl.define do
  sequence(:random_domain) { random_domain }
  sequence(:random_url) { random_url }
end