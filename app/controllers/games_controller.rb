class GamesController < ApplicationController
  include StatusRender

  def create
    game = Game.create(create_params)
    game.process_board(params[:board])
    render_success(game)
  end

  private

  def create_params
  end
end
