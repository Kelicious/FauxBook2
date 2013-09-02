require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "a@a.com", password: "password",
                     password_confirmation: "password",
                     first_name: "Bob",
                     last_name: "Jones",
                     gender: "male",
                     birth_date: Date.parse("1999-12-31"),
                     )
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }
  it { should respond_to(:birth_date) }
  it { should respond_to(:about) }
  it { should respond_to(:political_views) }
  it { should respond_to(:religious_views) }
  it { should respond_to(:looking_for) }
  it { should respond_to(:interested_in) }
  it { should respond_to(:favorite_quotes) }
  it { should respond_to(:profile_picture_url_big) }
  it { should respond_to(:profile_picture_url_small) }
  it { should respond_to(:cover_picture_url) }
  it { should respond_to(:friend_request_recipient_ids) }
  it { should respond_to(:friend_request_sender_ids) }
  it { should respond_to(:wall_post_ids) }
  it { should respond_to(:album_ids) }

  it { should be_valid }

  describe "when first name is blank" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is blank" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when gender is blank" do
    before { @user.gender = " " }
    it { should_not be_valid }
  end

  describe "when birth date is blank" do
    before { @user.birth_date = " " }
    it { should_not be_valid }
  end

  describe "when email address is taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email.upcase!
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "friend requests" do
    before do
      @user.save
      @other_user = User.create(email: "b@b.com", password: "password",
                                password_confirmation: "password",
                                first_name: "John",
                                last_name: "Smith",
                                gender: "male",
                                birth_date: Date.parse("1999-12-31"),
                                )
    end

    describe "not friends yet" do
      # remove the 'is' later?
      it { should_not be_is_friend_of @other_user }
    end

    context "sending friend request" do
      before do
        FriendRequest.create(sender_id: @user.id, recipient_id: @other_user.id)
      end

      it { should have(1).outgoing_friend_request }
      it { @other_user.should have(1).incoming_friend_request }

      describe "accepting a friend request" do
        before { FriendRequest.first.approve! }
        it { should have(0).outgoing_friend_requests }
        it { should be_is_friend_of(@other_user) }
        it { @other_user.should have(0).incoming_friend_requests }
      end

      describe "rejecting a friend request" do
        before { FriendRequest.first.destroy }
        it { should have(0).outgoing_friend_requests }
        it { should_not be_is_friend_of(@other_user) }
        it { @other_user.should have(0).incoming_friend_requests }
      end
    end
    describe "removing a friend" do
      before do
        FriendRequest.create(sender_id: @user.id, recipient_id: @other_user.id)
        FriendRequest.first.approve!
        Friendship.first.destroy!
      end

      it { should_not be_is_friend_of(@other_user) }
      it { @other_user.should_not be_is_friend_of(@user) }
    end
  end

  describe "post associations" do
    before do
      @user.save
      @first_post = @user.authored_posts.create(user_id: @user.id, body: "First Post")
      @second_post = @user.authored_posts.create(user_id: @user.id, body: "Second Post")
    end

    it { should have(2).wall_posts }
    it { should have(2).authored_posts }
    
    it "should have more recent wall posts first" do
      @user.wall_posts.should == [@second_post, @first_post]
    end
  end
end
