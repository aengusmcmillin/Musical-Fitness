require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('home')
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('contact')
  end

  it "should have a About page at '/about'" do
    get '/about'
    response.should render_template('about')
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('help')
  end

  it "should have a Signup page at '/signup'" do
    get '/signup'
    response.should render_template('users/new')
  end
end
