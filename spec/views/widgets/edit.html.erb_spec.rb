require 'rails_helper'

RSpec.describe "Widgets/edit", type: :view do
  before(:each) do
    @Widget = assign(:Widget, Widget.create!(
      name: "MyString"
    ))
  end

  it "renders the edit Widget form" do
    render

    assert_select "form[action=?][method=?]", Widget_path(@Widget), "post" do

      assert_select "input[name=?]", "Widget[name]"
    end
  end
end
