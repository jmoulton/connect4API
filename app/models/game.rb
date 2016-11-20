class Game < ApplicationRecord
  has_many :moves

  def process_board(board)
  end
end
