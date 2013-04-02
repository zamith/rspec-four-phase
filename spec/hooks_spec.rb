require_relative '../lib/rspec/four_phase'

class Dummy
  include RSpec::Core::Hooks
end

describe "hooks" do

  context "disabled" do
    it "warns me I'm doing it wrong" do
      dummy_obj = Dummy.new

      [:before, :after, :around].each do |hook_name|
        Rspec::FourPhase.log.should_receive(:info)

        dummy_obj.send hook_name, {}
      end
    end

    it "stops the execution of the hook" do
      dummy_obj = Dummy.new
      Rspec::FourPhase.log.stub(:info)

      dummy_obj.before :each do
        @name = "not called"
      end

      dummy_obj.hooks[:before][:each].should be_empty
    end

    it "only happens when file is in spec dir" do
      dummy_obj = Dummy.new
      dummy_obj.stub(:caller).and_return(["random_initializer.rb"])

      dummy_obj.before :each do
        @name = "not called"
      end

      dummy_obj.hooks[:before][:each].should_not be_empty
    end
  end
end
