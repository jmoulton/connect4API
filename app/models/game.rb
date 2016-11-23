class Game < ApplicationRecord
  has_many :moves

  def process_board(board)
    return true if check_vertical(board)
    return true if check_horizontal(board)
    return true if check_right_diagonal(board)
    return true if check_left_diagonal(board)
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

    return false
  end

  def check_right_diagonal(board)
    board.first(4).each_with_index do |col, column_index|
      col.each_with_index do |val, val_index|
        arr = Array.new(val_index + 1)
        arr[0] = val
        cursor = column_index
        cursor2 = val_index
        arr.count.times do |arr_index|
          unless arr_index == 0
            arr[arr_index] = board[cursor + 1][cursor2 - 1]
            cursor2 -= 1
            cursor += 1
          end
        end

        return true if sequence_check(arr.compact)
      end
    end

    return false
  end

  def check_left_diagonal(board)
    board.first(4).each_with_index do |col, column_index|
      col.each_with_index do |val, val_index|
        arr = Array.new(board.count - column_index)
        arr[0] = val
        cursor = column_index
        cursor2 = val_index
        arr.count.times do |arr_index|
          unless arr_index == 0
            arr[arr_index] = board[cursor + 1][cursor2 + 1]
            cursor2 += 1
            cursor += 1
          end
        end

        return true if sequence_check(arr.compact)
      end
    end

    return false
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
