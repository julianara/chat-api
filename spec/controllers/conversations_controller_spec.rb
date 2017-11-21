require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do


	# lists all convos 
	

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "shows all conversations"
	end
  end

end