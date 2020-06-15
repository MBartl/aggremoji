require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WidgetsHelper. For example:
#
# describe WidgetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe WidgetsHelper do

  describe ".add" do
    context "two numbers" do
      context "given '2,4'" do
        it "returns 6" do
          expect(WidgetsHelper.add("2,4")).to eql(6)
        end
      end

      context "given '17,100'" do
        it "returns 117" do
          expect(WidgetsHelper.add("17,100")).to eql(117)
        end
      end
    end
  end
end
# RSpec.describe WidgetsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
