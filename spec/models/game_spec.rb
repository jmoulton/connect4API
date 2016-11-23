require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'process_board' do
    let(:game) { Game.new() }
    context '#check_vertical' do
      it 'returns true when there are four vertically' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"},
                  {"turn"=>"player", "row"=>1, "col"=>"A"},
                  {"turn"=>"player", "row"=>2, "col"=>"A"},
                  {"turn"=>"player", "row"=>3, "col"=>"A"}],
        [{"turn"=>"cpu", "row"=>0, "col"=>"B"}, {"turn"=>"cpu", "row"=>1, "col"=>"B"}, {"turn"=>"cpu", "row"=>2, "col"=>"B"}],
        [{"turn"=>"player", "row"=>0, "col"=>"C"}],
        [],
        [],
        [],
        []]

        expect(game.check_vertical(board)).to be(true)

      end

      it 'returns false when there are not four vertically' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"B"}],
                 [{"turn"=>"player", "row"=>0, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"player", "row"=>1, "col"=>"D"}],
                 [],
                 [],
                 []]

        expect(game.check_vertical(board)).to be(false)

      end
    end

    context '#check_horizontal' do
      it 'returns true when there are four horizontally' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"B"}, {"turn"=>"player", "row"=>1, "col"=>"B"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"C"}, {"turn"=>"player", "row"=>1, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"player", "row"=>1, "col"=>"D"}, {"turn"=>"cpu", "row"=>2, "col"=>"D"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"E"}],
                 [],
                 []]

        expect(game.check_horizontal(board)).to be(true)
      end

      it 'returns false when there are not four horizontally' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"B"}],
                 [{"turn"=>"player", "row"=>0, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"player", "row"=>1, "col"=>"D"}],
                 [],
                 [],
                 []]

        expect(game.check_horizontal(board)).to be(false)
      end
    end

    context '#check_right_diagonal' do
      it 'returns true when there are four diagonally right' do
        board = [[],
                 [],
                 [{"turn"=>"player", "row"=>0, "col"=>"C"}, {"turn"=>"cpu", "row"=>1, "col"=>"C"}, {"turn"=>"cpu", "row"=>2, "col"=>"C"}, {"turn"=>"player", "row"=>3, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"cpu", "row"=>1, "col"=>"D"}, {"turn"=>"player", "row"=>2, "col"=>"D"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"E"}, {"turn"=>"player", "row"=>1, "col"=>"E"}, {"turn"=>"player", "row"=>2, "col"=>"E"}],
                 [{"turn"=>"player", "row"=>0, "col"=>"F"}, {"turn"=>"player", "row"=>1, "col"=>"F"}],
                 []]

        expect(game.check_right_diagonal(board)).to be(true)
      end

      it 'returns false when there are not four diagonally right' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"B"}],
                 [{"turn"=>"player", "row"=>0, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"player", "row"=>1, "col"=>"D"}],
                 [],
                 [],
                 []]

        expect(game.check_right_diagonal(board)).to be(false)
      end
    end

    context 'check_left_diagonal' do
      it 'returns true when there are four diagonally left' do
        board =  [{"turn"=>"player", "row"=>0, "col"=>"B"}],
          [{"turn"=>"cpu", "row"=>0, "col"=>"C"},
           {"turn"=>"player", "row"=>1, "col"=>"C"}],
          [{"turn"=>"cpu", "row"=>0, "col"=>"D"},
           {"turn"=>"player", "row"=>1, "col"=>"D"},
           {"turn"=>"player", "row"=>2, "col"=>"D"}],
          [{"turn"=>"cpu", "row"=>0, "col"=>"E"},
           {"turn"=>"cpu", "row"=>1, "col"=>"E"},
           {"turn"=>"cpu", "row"=>2, "col"=>"E"},
           {"turn"=>"player", "row"=>3, "col"=>"E"}],
          [{"turn"=>"player", "row"=>0, "col"=>"F"},
           {"turn"=>"player", "row"=>1, "col"=>"F"}]

          expect(game.check_left_diagonal(board)).to be(true)
      end

      it 'returns false when there are not four diagonally left' do
        board = [[{"turn"=>"player", "row"=>0, "col"=>"A"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"B"}],
                 [{"turn"=>"player", "row"=>0, "col"=>"C"}],
                 [{"turn"=>"cpu", "row"=>0, "col"=>"D"}, {"turn"=>"player", "row"=>1, "col"=>"D"}],
                 [],
                 [],
                 []]

        expect(game.check_left_diagonal(board)).to be(false)
      end
    end
  end
end
