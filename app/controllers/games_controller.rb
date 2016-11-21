class GamesController < ApplicationController
  include StatusRender

  def create
    game = Game.create(create_params)
    game.process_board(params[:board])
    render_success(game)
  end

  def update
    game = Game.find(params[:id])
    game_over = game.process_board(params[:board])
    game.update_attributes(status: "Game Over") if game_over
    render_success(game)
  end

  private

  def create_params
  end
end
