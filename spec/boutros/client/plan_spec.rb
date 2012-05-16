require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'plans' do
    before do
      stub_get('/admin/api/account_plans.xml', :plans)

      @plans = @client.plans
    end

    it "should return an array of plans" do
      @plans.should be_an Array
      @plans.first.should be_a Boutros::Plan
    end
  end

  describe 'plan' do
    it "should be get-able" do
      stub_get('/admin/api/account_plans/236.xml', :plan)

      @client.plan(236).should be_a Boutros::Plan
    end
  end

end