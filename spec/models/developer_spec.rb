require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:email) }
    it { should allow_value('test_user@gmail.com').for(:email) }
  end 

  describe 'Association' do
    it { should have_many(:developer_languages) }
    it { should have_many(:languages).through(:developer_languages) }
    it { should have_many(:developer_programming_languages) }  
    it { should have_many(:programming_languages).through(:developer_programming_languages) }
  end
end
