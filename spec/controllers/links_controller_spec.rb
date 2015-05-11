require 'rails_helper'

describe LinksController do

  context "Post create" do
    let(:valid_url) { FactoryGirl.generate(:random_url) }
    let(:invalid_url) {"hotdogforlunch.gunit"}

    context "With a valid url" do
      let!(:the_request) { post 'create', format: "json", original_url: valid_url }

      it "returns the shortened link partial" do
        expect(response).to render_template(:partial => '_link_list_item.html.erb')
      end
    end

    context "With an invalid url" do
      let!(:the_request) { post 'create', format: "json", original_url: invalid_url }

      it "returns the error link partial" do
        expect(response).to render_template(:partial => '_link_errors.html.erb')
      end
    end
  end

  context "Get redirect" do
    let(:link) { FactoryGirl.create(:link) }
    let(:valid_token) { FactoryGirl.generate(:random_url) }
    let(:invalid_token) {"1234"}

    context "With a valid token" do
      let!(:the_request) { get 'redirect', format: "json", token: link.token }

      it "redirects to the correct url" do
        expect(response).to redirect_to(link.original_url)
      end
    end

    context "With an invalid token" do
      let!(:the_request) { get 'redirect', format: "json", token: "trihh" }

      it "returns a not found status code" do
        expect(response.code).to eq("404")
      end
    end
  end
end
