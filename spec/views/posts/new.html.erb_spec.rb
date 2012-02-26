require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
    end
  end
end
