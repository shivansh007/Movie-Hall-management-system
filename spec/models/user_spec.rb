require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'success' do
      @user = build(:user)
      @user.should be_valid
    end

    it 'fails when name not present' do
      @user = build(:user, name: '')
      @user.should_not be_valid
    end

    it 'fails when phone not present' do
      @user = build(:user, phone: '')
      @user.should_not be_valid
    end

    it 'fails when email not present' do
      @user = build(:user, email: '')
      @user.should_not be_valid
    end

    it 'fails when email is invalid' do
      @user = build(:user, email: 'shivansh@shivanshc')
      @user.should_not be_valid
    end

    it 'fails when phone length less than 6' do
      @user = build(:user, phone: '11111')
      @user.should_not be_valid
    end

    it 'fails when phone length more than 15' do
      @user = build(:user, phone: '1111111111111111')
      @user.should_not be_valid
    end
  end

  context 'association' do
    it 'should have many bookings' do
      user = create(:user)
      booking1 = create(:booking, user_id: user.id)
      booking2 = create(:booking, user_id: user.id)
      booking1.user_id.should(eq user.id) && booking2.user_id.should(eq user.id)
    end
  end
end
