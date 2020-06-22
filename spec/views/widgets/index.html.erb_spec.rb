require 'rails_helper'

RSpec.describe "Widgets/index", type: :view do
  before(:each) do
    assign(:Widgets, [
      Widget.create!(
        name: "Name"
      ),
      Widget.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of Widgets" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
