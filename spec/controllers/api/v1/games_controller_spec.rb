require 'rails_helper'
include Api::V1

RSpec.describe Api::V1::GamesController, type: :controller do

  let(:valid_attributes) {
    {
      name: 'Sarah',
      min_players: 2,
      max_players: 2
    }
  }

  let(:invalid_attributes) { {} }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, params: {game: valid_attributes}, session: valid_session
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, params: {game: valid_attributes}, session: valid_session
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, params: {game: valid_attributes}, session: valid_session
        expect(response.status).to be(201)
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested game" do
  #       game = Game.create! valid_attributes
  #       put :update, params: {id: game.to_param, game: new_attributes}, session: valid_session
  #       game.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested game as @game" do
  #       game = Game.create! valid_attributes
  #       put :update, params: {id: game.to_param, game: valid_attributes}, session: valid_session
  #       expect(assigns(:game)).to eq(game)
  #     end

  #     it "redirects to the game" do
  #       game = Game.create! valid_attributes
  #       put :update, params: {id: game.to_param, game: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(game)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the game as @game" do
  #       game = Game.create! valid_attributes
  #       put :update, params: {id: game.to_param, game: invalid_attributes}, session: valid_session
  #       expect(assigns(:game)).to eq(game)
  #     end

  #     it "re-renders the 'edit' template" do
  #       game = Game.create! valid_attributes
  #       put :update, params: {id: game.to_param, game: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested game" do
  #     game = Game.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: game.to_param}, session: valid_session
  #     }.to change(Game, :count).by(-1)
  #   end

  #   it "redirects to the games list" do
  #     game = Game.create! valid_attributes
  #     delete :destroy, params: {id: game.to_param}, session: valid_session
  #     expect(response).to redirect_to(games_url)
  #   end
  # end

end
