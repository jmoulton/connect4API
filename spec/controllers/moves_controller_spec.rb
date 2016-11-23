require 'rails_helper'

RSpec.describe MovesController, type: :controller do
  context 'POST /moves' do
    let(:game) { Game.create() }
    it 'creates a new move' do
      post :create, coordinate: 'A1', player: 'Human', game_id: game.id

      expect(response.status).to eq(200)
      expect(Move.count).to eq(1)
    end
  end
end
