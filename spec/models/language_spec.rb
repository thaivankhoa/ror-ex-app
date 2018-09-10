require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:code) }
  end

  describe 'Association' do
    it { should have_many(:developer_languages) }
    it { should have_many(:developers).through(:developer_languages) }  
  end
end
