require "rails_helper"
require 'pry'

RSpec.describe CocktailsController do

  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe "GET #index" do
    let(:cocktails) { [
      instance_double(Cocktail),
      instance_double(Cocktail)
    ] }

    before do
      allow(user).to receive(:cocktails).and_return(cocktails)

      get :index
    end

    it "looks up all cocktails that belong to the current user" do
      expect(assigns(:cocktails)).to eq(cocktails)
    end
    
  end

  describe 'POST #create' do
    let(:cocktail) { FactoryBot.build_stubbed(:cocktail) } 
    let(:params) { { :name => "Martini", :ingredients => "Booze and an olive" } }

    before do
      allow(cocktail).to receive(:save)
      allow(user).to receive_message_chain(:cocktails, :build).and_return(cocktail)
    end

    it "saves the cocktail" do
      post :create, :params => { :cocktail => params }
      
      expect(cocktail).to have_received(:save)
    end
    
    context 'when the cocktail is successfully saved' do
      
      before do
        allow(cocktail).to receive(:save).and_return(true)
        
        post :create, :params => { :cocktail => params }
      end
      
      it 'redirects to the cocktail show page' do
        expect(response).to redirect_to(cocktail_path(cocktail))
      end
  
      it 'redirects to the cocktail show page' do
        expect(flash[:notice]).to eq('Cocktail was successfully created.')
      end
    end

    context "when the book can't be saved" do
      before do
        allow(cocktail).to receive(:save).and_return(false)

        post :create, :params => { :cocktail => params }
      end

      it "redirects back to the new page" do
        expect(response).to render_template(:new)
      end
    end

  end
  
  

end
