require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe "GET index" do
    it "redirect with unauthenticated user" do
      sign_in nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "success with authenticated user" do
      sign_in
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
