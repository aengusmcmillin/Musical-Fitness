require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    it "renders the correct template" do
      get 'home'
      response.should render_template("home")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    it "renders the correct template" do
      get 'about'
      response.should render_template("about")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    it "renders the correct template" do
      get 'contact'
      response.should render_template("contact")
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
    it "renders the correct template" do
      get 'help'
      response.should render_template("help")
    end
  end

end
