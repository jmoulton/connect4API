class Game < ApplicationRecord
  has_many :moves

  def process_board(board)
    return true if check_vertical(board)
    return true if check_horizontal(board)
    return false
  end

  def check_vertical(board)
    board.each do |cols|
      return true if sequence_check(cols)
    end

    return false
  end

  def check_horizontal(board)
    board.count.times do |index|
      arr = board.map { |cols| cols[index] }.compact
      return true if sequence_check(arr)
    end

    false
  end

  def sequence_check(arr)
    total = 0
    last_token = nil

    arr.each do |column|
      if column["turn"] == "player"
        if last_token == "player"
          total += 1
        else
          total = 1
        end

        last_token = "player"
      else
        if last_token == "cpu"
          total += 1
        else
          total = 1
        end

        last_token = "cpu"
      end

      return true if total >=4
    end

    return false
  end
end
