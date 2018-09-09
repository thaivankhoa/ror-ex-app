require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  describe 'GET #index' do
    let!(:dev1) { create(:developer) }
    let!(:dev2) { create(:developer) }
    let!(:dev3) { create(:developer) }
    let!(:en_language) { create(:language, code: 'en') }
    let!(:fr_language) { create(:language, code: 'fr') }
    let!(:ruby) { create(:programming_language, name: 'ruby') }
    let!(:python) { create(:programming_language, name: 'python') }
    let!(:java) { create(:programming_language, name: 'java') }
    let!(:dev_lan_1) { create(:developer_language, developer: dev1, language: en_language)}
    let!(:dev_lan_2) { create(:developer_language, developer: dev2, language: en_language)}
    let!(:dev_lan_3) { create(:developer_language, developer: dev3, language: fr_language)}
    let!(:dev_pro_lan_1) { create(:developer_programming_language, developer: dev1, programming_language: ruby) }
    let!(:dev_pro_lan_2) { create(:developer_programming_language, developer: dev2, programming_language: python) }
    let!(:dev_pro_lan_3) { create(:developer_programming_language, developer: dev3, programming_language: ruby) }
    
    describe 'when no search params' do
      before { get :index }
      context "return correct data" do
        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq(3)      
        end
      end
    end

    describe 'when search with programming language' do 
      context 'return correct data' do
        before { get :index, params: { programming_language: 'ruby' } }
        
        it do 
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq (2)
        end
      end

      context 'return empty data' do
        before { get :index, params: { programming_language: 'javascript' } }
        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers)).to be_empty 
        end
      end
    end

    describe 'when search with language' do
      context 'return correct data' do  
        before { get :index, params: { language: "en" } }
        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq(2)
        end 
      end 

      context 'return empty data' do 
        before { get :index, params: { language: "jp" } }
        it do
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers)).to be_empty
        end 
      end 
    end
    
    describe 'when search with both programming language and language' do
      context 'return correct data' do  
        before { get :index, params: { programming_language: 'ruby', language: 'en' } }
        it do 
          expect(response).to be_success
          expect(response).to render_template(:index)
          expect(assigns(:developers).size).to eq(1)      
        end 
      end 
    end
  end
end
