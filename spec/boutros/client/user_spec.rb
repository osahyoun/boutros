require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'user' do

    it 'should be get-able' do
      stub_get('/admin/api/accounts/10/users/20.xml', :user)

      @client.user(10,20).should be_a Boutros::User
    end

    it 'should be create-able' do
      body = {:email => 'foo@example.com', :username => 'barfoo', :password => 'foobar'}
      stub_post('/admin/api/accounts/10/users.xml', :user, body)

      user = @client.create_user(10, body)
      user.should be_a Boutros::User
    end

    it 'should be update-able' do
      body = {:email => 'foo@example.com', :username => 'barfoo', :password => 'foobar'}
      stub_put('/admin/api/accounts/10/users/20.xml', :user, body)

      user = @client.update_user(10,20, body)
      user.should be_a Boutros::User
    end

    it 'should be delete-able' do
      stub_delete('/admin/api/accounts/10/users/20.xml', '')

      @client.delete_user(10,20).should be_empty
    end

    it 'should be able to change role to admin' do
      stub_put('/admin/api/accounts/10/users/20/admin.xml', :user)

      @client.change_user_role(10, 20, :admin)
    end

    it 'should be able to change role to admin' do
      stub_put('/admin/api/accounts/10/users/20/member.xml', :user)

      @client.change_user_role(10, 20, :member)
    end

    it "should be suspend-able" do
      stub_put('/admin/api/accounts/10/users/20/suspend.xml', :user)

      @client.suspend_user(10, 20)
    end

    it "should be unsuspend-able" do
      stub_put('/admin/api/accounts/10/users/20/unsuspend.xml', :user)

      @client.unsuspend_user(10, 20)
    end

    it "should be activate-able" do
      stub_put('/admin/api/accounts/10/users/20/activate.xml', :user)

      @client.activate_user(10, 20)
    end

  end

  describe 'users' do
    it 'should be get-able' do
     stub_get('/admin/api/accounts/10/users.xml', :users)

     @client.users(10).first.should be_a Boutros::User
    end
  end


end