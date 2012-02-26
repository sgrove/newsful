require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path, :method => "post" do
    end
  end
end
