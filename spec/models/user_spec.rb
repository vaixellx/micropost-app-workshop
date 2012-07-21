require 'spec_helper'

describe User do

  context "Database Schema" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
  end

  context "Associations" do
    it { should have_many(:relationships) }
    it { should have_many(:following_users).through(:relationships) }
    it { should have_many(:reverse_relationships).class_name('Relationship') }
    it { should have_many(:follower_users).through(:reverse_relationships) }
    it { should have_many(:microposts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context "Methods" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }

    it { should respond_to(:relationships) }
    it { should respond_to(:following_users) }
    it { should respond_to(:reverse_relations) }
    it { should respond_to(:followed_users) }
    it { should respond_to(:microposts) }
  end

  context "Create new User" do

    before(:each) do
      password = Forgery::Basic.password
      @user = User.new(:name => Forgery::Name.first_name,
                       :email => Forgery::Internet.email_address,
                       :password => password,
                       :password_confirmation => password)
    end

    it "when name is not present" do
      @user.name = " "
      @user.should_not be_valid
      @user.should have(1).error_on(:name)
    end

    it "when email is not present" do
      @user.email = " "
      @user.should_not be_valid
      @user.should have(2).error_on(:email)
    end

    it "when password is not present" do
      @user.password = @user.password_confirmation = " "
      @user.should_not be_valid
      @user.should have(1).error_on(:password)
    end

    it "when password doesn't match confirmation" do
      @user.password_confirmation = "mismatch"
      @user.should_not be_valid
      @user.should have(1).error_on(:password)
    end

    it "with a password that's too short" do
      @user.password = @user.password_confirmation = "123"
      @user.should_not be_valid
      @user.should have(1).error_on(:password)
    end

    context "with invalid email format" do
      it "should be invalid" do
        addresses = %w(user@foo,com user_at_foo.org example.user@foo.)
        addresses.each do |invalid_address|
          @user.email = invalid_address
          @user.should_not be_valid
          @user.should have(1).error_on(:email)
        end
      end
    end

    context "with valid email format" do
      it "should be valid" do
        addresses = %w(monsiree.t@inotechne.com pratompol@ino.COM virudson@ino.tech)
        addresses.each do |invalid_address|
          @user.email = invalid_address
          @user.should be_valid
        end
      end
    end

  end # context "Create new User"

end
