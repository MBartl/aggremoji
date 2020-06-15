require 'rails_helper'
# require 'pry'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#page_title" do
    it "returns the default title" do
      expect(helper.page_title).to eq("RSpec is your friend")
    end
  end
end
