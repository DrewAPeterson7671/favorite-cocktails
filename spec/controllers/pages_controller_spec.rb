# require 'rails_helper'
# # require_relative './../example'

# # RSpec.describe PagesController do

# #   describe 'Example api call' do
# #     let(:drink_response) { PagesController.api_call }
# #     it "returns correctly some data" do
# #       expect(drink_response).to be_kind_of(Hash)
# #       expect(drink_response).to have_key(:status)
# #       expect(drink_response).to have_key(:data)
# #     end
# #   end
# # end

# RSpec.describe PagesController, :type => :controller do

#   controller do
#     def search_results
#       render :json => {}, :status => 209
#     end
#   end

#   describe "Get #search_results " do
#     it "returns a 209 custom status code" do
#       get :search_results
#       expect(response).to have_http_status(209)
#     end
#   end

# end


