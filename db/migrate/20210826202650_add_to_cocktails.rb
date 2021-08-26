class AddToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column(:cocktails, :api_id_drink, :string)
    add_column(:cocktails, :category, :string)
    add_column(:cocktails, :alcoholic, :string)
    add_column(:cocktails, :glass, :string)
    add_column(:cocktails, :instructions, :text)
    add_column(:cocktails, :api_image_url, :string)
  end
end
