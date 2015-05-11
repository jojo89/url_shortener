require 'rails_helper'

describe Link do

  def original_url
    FactoryGirl.generate(:random_url)
  end

  subject { FactoryGirl.create(:link, original_url: original_url) }
  let(:base_url) { FactoryGirl.generate(:random_domain) }

  describe "#shortened_url" do
    let(:shortened_link) { base_url + "/l/" + subject.token }

    it "concatenates the base_url with the token" do
      expect(subject.shortened_url(base_url)).to eq(shortened_link)
    end
  end

  describe "#increment_access_count" do
    before do
      subject.increment_access_count
    end

    it "increments the access_count by 1" do
      expect(subject.access_count).to eq(1)
    end
  end

  describe "#most_visited" do
    let(:limit) { 5 }
    let!(:best_link) { FactoryGirl.create(:link, original_url: original_url, access_count: 3) }

    before do
      9.times do
        FactoryGirl.create(:link, original_url: original_url)
      end
    end

    it "limits the records to the given limit" do
      expect(Link.most_visited(limit).length).to eq(limit)
    end

    it "returns the links in descending order" do
      expect(Link.most_visited(limit).first).to eq(best_link)
    end
  end
end
