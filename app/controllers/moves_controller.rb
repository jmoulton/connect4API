class MovesController < ApplicationController
  include StatusRender

  def create
    move = Move.create(create_params)
    render_success(move)
  end

  private

  def create_params
    params.permit(:player, :coordinate, :game_id)
  end
end
