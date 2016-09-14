# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #index" do
    let!(:orders) do
      create_list(:order, 5)
    end

    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'does return all resources created' do
      expect(assigns(:orders)).to eq(orders)
    end
  end

  describe "GET #upload" do
    it "returns http success" do
      get :upload
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #store_from_file' do
    let(:file)  { fixture_file_upload('dados.txt') }
    let(:params) { {order: {file: file}} }

    it 'does store orders from file' do
      expect { post :store_from_file, params: params }.to change(Order, :count)
    end
  end
end
