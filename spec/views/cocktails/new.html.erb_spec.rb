# require 'rails_helper'

# RSpec.describe "cocktails/new", type: :view do
#   before(:each) do
#     assign(:cocktail, Cocktail.new(
#       name: "MyString",
#       ingredients: "MyText",
#       user_id: 1
#     ))
#   end

#   it "renders new cocktail form" do
#     render

#     assert_select "form[action=?][method=?]", cocktails_path, "post" do

#       assert_select "input[name=?]", "cocktail[name]"

#       assert_select "textarea[name=?]", "cocktail[ingredients]"

#       assert_select "input[name=?]", "cocktail[user_id]"
#     end
#   end
# end
