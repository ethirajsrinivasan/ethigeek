require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :title => "Title",
        :state => "State",
        :content_url => "Content Url"
      ),
      Blog.create!(
        :title => "Title",
        :state => "State",
        :content_url => "Content Url"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Content Url".to_s, :count => 2
  end
end
