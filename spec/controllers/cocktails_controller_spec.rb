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
  
  describe "PATCH #update" do
    let(:cocktail) { FactoryBot.build_stubbed(:cocktail) }

    before do
      allow(Cocktail).to receive(:find).and_return(cocktail)
      allow(cocktail).to receive(:update).and_return(true)
    end

    it "updates the cocktail" do
      patch :update, :params => {
        :id => cocktail.id,
        :cocktail => { :name => "New Name"} }

      expect(cocktail).to have_received(:update)
    end

    context "when update succeeds" do
      it "redirects to the cocktail page" do
        patch :update, :params => {
          :id => cocktail.id,
          :cocktail => { :cocktail => "New Name" } }
        
        expect(response).to redirect_to(cocktail_path(cocktail))
      end
    end

    context "when the update fails" do
      before do
        allow(cocktail).to receive(:update).and_return(false)
      end

      it "renders the edit page again" do
        patch :update, :params => {
          :id => cocktail.id,
          :cocktail => { :name => "New Name" } }
        
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:cocktail) { FactoryBot.build_stubbed(:cocktail) }

    before do
      allow(Cocktail).to receive(:find).and_return(cocktail)
      allow(cocktail).to receive(:destroy)

      delete :destroy, :params => { :id => cocktail.id }
    end

    it "deletes the cocktail" do
      expect(cocktail).to have_received(:destroy)
    end

    it "redirects to the index page" do
      expect(response).to redirect_to(cocktails_path)
    end
  end

end
