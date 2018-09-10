require 'rails_helper'

RSpec.describe ProgrammingLanguage, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:name) }
  end

  describe 'Association' do
    it { should have_many(:developer_programming_languages) } 
    it { should have_many(:developers).through(:developer_programming_languages) }
  end 
end
