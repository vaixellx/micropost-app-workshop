require 'spec_helper'

describe Relationship do

  context "Database Schema" do
    it { should have_db_column(:follower_id).of_type(:integer) }
    it { should have_db_column(:followed_id).of_type(:integer) }
  end

  context "Associations" do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end


  describe "Validations" do
  end


  context "Methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    it { should respond_to(:followed_id) }
  end

  context "Make new Relationship" do
  end

end
