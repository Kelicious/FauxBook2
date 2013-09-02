require 'spec_helper'

describe Post do
  let(:first_user) { FactoryGirl.create(:user) }
  let(:second_user) { FactoryGirl.create(:user) }

  before { @post = FactoryGirl.build(:post, user_id: first_user.id, author_id: first_user.id) }

  subject { @post }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:author_id) }
  it { should respond_to(:created_at) }

  its(:user) { should == first_user }
  its(:author) { should == first_user }

  describe "when posting on the user's own wall" do
    it { should be_valid }
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "when author_id is not present" do
    before { @post.author_id = nil }
    it { should_not be_valid }
  end

  describe "with blank body" do
    before { @post.body = "" }
    it { should_not be_valid }
  end
end
