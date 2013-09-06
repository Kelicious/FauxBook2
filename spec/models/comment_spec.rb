require 'spec_helper'

describe Comment do
  let(:first_user) { FactoryGirl.create(:user) }
  let(:second_user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, user_id: first_user.id, author_id: first_user.id) }

  before do
    # associations don't get set properly if foreign keys are hard coded...
    # i.e. its { author_id should == first_user.id } passes
    # but its { author should == first_user } fails, wtf?
    @comment = FactoryGirl.build(:comment, author_id: first_user.id,
                                 commentable_type: "Post",
                                 commentable_id: post.id)
  end

  subject { @comment }

  it { should respond_to(:body) }
  it { should respond_to(:commentable) }
  it { should respond_to(:author_id) }

  its(:author) { should == first_user }
  its(:commentable) { should == post }

  describe "when commenting on the user's own post" do
    it { should be_valid }
  end

  describe "when author_id is not present" do
    before { @comment.author_id = "" }
    it { should_not be_valid }
  end

  describe "whith blank body" do
    before { @comment.body = "" }
    it { should_not be_valid }
  end

  describe "checking friendship" do
    before { @comment.author = second_user }

    context "when the commentable owner is not a friend" do
      it { should_not be_valid }
    end

    context "when the commentable owner is a friend" do
      before do
        FriendRequest.create(sender_id: first_user.id, recipient_id: second_user.id)
        FriendRequest.first.approve!
      end

      it { should be_valid }
    end
  end
end
