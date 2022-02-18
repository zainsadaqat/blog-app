require "rails_helper"

RSpec.describe "Inside users_controller:", :type => :request do
  describe 'GET /users/' do
    before(:example) { get users_path }

    it 'server return 200 server ok' do
      expect(response).to have_http_status(200)
    end

    it 'Rendering Index Template' do
      expect(response).to render_template(:index)
    end

    it "Body Content of Index.html.erb" do
      expect(response.body).to include('<h1>users</h1>')
    end
  end

  describe 'GET /users/:id' do
    before(:example) { get('/users/12') }

    it 'return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'Rendering Show Template' do
      expect(response).to render_template(:show)
    end

    it "Body Content of Show.html.erb" do
      expect(response.body).to include('<h1>users</h1>')
    end    
  end
end