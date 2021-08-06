require 'rails_helper'

RSpec.describe "cocktails/edit", type: :view do
  before(:each) do
    @cocktail = assign(:cocktail, Cocktail.create!(
      name: "MyString",
      ingredients: "MyText",
      user_id: 1
    ))
  end

  it "renders the edit cocktail form" do
    render

    assert_select "form[action=?][method=?]", cocktail_path(@cocktail), "post" do

      assert_select "input[name=?]", "cocktail[name]"

      assert_select "textarea[name=?]", "cocktail[ingredients]"

      assert_select "input[name=?]", "cocktail[user_id]"
    end
  end
end
