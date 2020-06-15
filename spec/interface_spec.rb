# spec/interface_spec.rb
describe Interface do

  # Are we properly greeting our users?
  describe "#welcome" do
    context "upon program start-up " do
      it "properly welcomes our user" do
      expect do
        welcome
        # expect Rails.logger.should_receive(:info).with("Yo waddup")

        end.to output('Yo waddup').to_stdout
      end
    end
  end
end
