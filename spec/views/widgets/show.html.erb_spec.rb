require 'rails_helper'

RSpec.describe "Widgets/show", type: :view do
  before(:each) do
    @Widget = assign(:Widget, Widget.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
