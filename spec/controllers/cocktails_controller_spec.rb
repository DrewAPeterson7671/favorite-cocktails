require "rails_helper"

RSpec.describe CocktailsController do

  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe "GET #index" do
    let(:coctails) { [
      instance_double(Cocktail),
      instance_double(Cocktail)
    ] }

    before do
      allow(user).to receive(:cocktails).and_return(cocktails)

      get :index
    end

    it "looks up all cocktails that belong to the current user" do
      expect(assigns(:cocktails)).to_eq(cocktails)
    end
    
  end

end
