require 'helper'

describe Boutros::Account do

  it "should be instantiable" do
    data = Nori.parse(fixture('account')).values.first
    account = Boutros::Account.new(data)

    account.org_name.should == 'testapi'
    account.credit_card_stored?.should be(false)
  end


  it "should be updateable" do
    @client = mock(Boutros::Client)
    account = Boutros::Account.new({'org_name' => 'Foo Bar', 'id' => 3}, @client)
    account.org_name = 'Bar Foo'

    @client.should_receive(:update_account).with(3,{:org_name => 'Bar Foo'})
    account.save
  end

  describe "associations" do
    before do
      data = Nori.parse(fixture('account')).values.first
      @account = Boutros::Account.new(data)
    end

    it "should have plans" do
      @account.plans.should be_an Array
      @account.plans.first.should be_a Boutros::Plan
    end

    it "should have users" do
      @account.users.should be_an Array
      @account.users.first.should be_a Boutros::User
    end

  end
end