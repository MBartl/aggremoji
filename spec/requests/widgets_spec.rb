require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/Widgets", type: :request do
  # Widget. As you add validations to Widget, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  # ________________________________________
  # UNUSED PATHS ARE CURRENTLY COMMENTED OUT
  # THIS KEEPS NOISE DOWN ON PENDING TESTS
  # ________________________________________

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Widget.create! valid_attributes
  #     get Widgets_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /show" do
  #   it "renders a successful response" do
  #     Widget = Widget.create! valid_attributes
  #     get Widget_url(Widget)
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET /new" do
    it "renders a successful response" do
      get new_Widget_url
      expect(response).to be_successful
    end
  end

  # describe "GET /edit" do
  #   it "render a successful response" do
  #     Widget = Widget.create! valid_attributes
  #     get edit_Widget_url(Widget)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Widget" do
  #       expect {
  #         post Widgets_url, params: { Widget: valid_attributes }
  #       }.to change(Widget, :count).by(1)
  #     end
  #
  #     it "redirects to the created Widget" do
  #       post Widgets_url, params: { Widget: valid_attributes }
  #       expect(response).to redirect_to(Widget_url(Widget.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Widget" do
  #       expect {
  #         post Widgets_url, params: { Widget: invalid_attributes }
  #       }.to change(Widget, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post Widgets_url, params: { Widget: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested Widget" do
  #       Widget = Widget.create! valid_attributes
  #       patch Widget_url(Widget), params: { Widget: new_attributes }
  #       Widget.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the Widget" do
  #       Widget = Widget.create! valid_attributes
  #       patch Widget_url(Widget), params: { Widget: new_attributes }
  #       Widget.reload
  #       expect(response).to redirect_to(Widget_url(Widget))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       Widget = Widget.create! valid_attributes
  #       patch Widget_url(Widget), params: { Widget: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested Widget" do
  #     Widget = Widget.create! valid_attributes
  #     expect {
  #       delete Widget_url(Widget)
  #     }.to change(Widget, :count).by(-1)
  #   end
  #
  #   it "redirects to the Widgets list" do
  #     Widget = Widget.create! valid_attributes
  #     delete Widget_url(Widget)
  #     expect(response).to redirect_to(Widgets_url)
  #   end
  # end
end
