require 'rails_helper'

RSpec.describe "cocktails/index", type: :view do
  before(:each) do
    assign(:cocktails, [
      Cocktail.create!(
        name: "Name",
        ingredients: "MyText",
        user_id: 2
      ),
      Cocktail.create!(
        name: "Name",
        ingredients: "MyText",
        user_id: 2
      )
    ])
  end

  it "renders a list of cocktails" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
