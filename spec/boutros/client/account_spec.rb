require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'account' do
    it "should be get-able" do
      stub_get('/admin/api/accounts/126.xml', :account)

      @client.account(126).should be_a Boutros::Account
    end

    it "should be update-able" do
      body = {:org_name => 'Foo Bar'}
      stub_put('/admin/api/accounts/126.xml', :account, body)

        @client.update_account(126, body).
          should be_a Boutros::Account
    end

    it "should be able to change plan" do
      body = {:plan_id => '100'}
      stub_put("/admin/api/accounts/99/change_plan.xml", :plan, body)

      @client.change_account_plan(99, body).
        should be_a Boutros::Plan
    end

    it "should be able to approve account" do
      stub_put('/admin/api/accounts/126/approve.xml', :account)

      @client.approve_account(126).
        should be_a Boutros::Account
    end

    it "should be able to reject account" do
      stub_put('/admin/api/accounts/126/reject.xml', :account)

      @client.reject_account(126).should be_a Boutros::Account
    end

    it "should be able to reset account to pending" do
      stub_put('/admin/api/accounts/126/make_pending.xml', :account)

      @client.make_account_pending(126).should be_a Boutros::Account
    end

    it "should be delete-able" do
      pending
    end
  end


  describe 'accounts' do
    before do
      stub_get('/admin/api/accounts.xml', :accounts)

      @accounts = @client.accounts
    end

    it "should return an array of accounts" do
      @accounts.should be_an Array
      @accounts.first.should be_a Boutros::Account
    end

    it "should return users of an account" do
      @accounts.first.users.should be_an Array
      @accounts.first.users.first.should be_a Boutros::User
      @accounts.first.users.first.username.should == 'BusinessPartner1'
    end

  end

end