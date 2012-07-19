require 'spec_helper'

describe Micropost do

  context "Database Schema" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }
  end


  context "Associations" do
    it { should belong_to(:user) }
  end


  describe "Validations" do
  end


  context "Methods" do
    it { should respond_to(:user) }
    it { should respond_to(:user_id) }
    it { should respond_to(:content) }
  end


  context "Create new Micropost" do
  end
end
