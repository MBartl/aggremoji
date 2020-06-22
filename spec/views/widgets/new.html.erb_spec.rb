require 'rails_helper'

RSpec.describe "Widgets/new", type: :view do
  before(:each) do
    assign(:Widget, Widget.new(
      name: "MyString"
    ))
  end

  it "renders new Widget form" do
    render

    assert_select "form[action=?][method=?]", Widgets_path, "post" do

      assert_select "input[name=?]", "Widget[name]"
    end
  end
end
