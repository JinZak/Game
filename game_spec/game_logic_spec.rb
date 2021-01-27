require 'rspec'
require '../game/game_logic'

describe GameLogic do
  let(:game) { GameLogic.new }

  describe 'check results' do
    context 'user win' do
      context 'rock-scissor' do
        before do
          $stdin = StringIO.new('1')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(2)
          game.bot_input
          expect do
            game.results.to output('Победа')
          end
        end
      end

      context 'scissor-paper' do
        before do
          $stdin = StringIO.new('2')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(3)
          game.bot_input
          expect do
            game.results.to output('Победа')
          end
        end
      end

      context 'user win if paper-rock' do
        before do
          $stdin = StringIO.new('3')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(1)
          game.bot_input
          expect do
            game.results.to output('Победа')
          end
        end
      end
    end

    context 'user lose' do
      context 'scissor-rock' do
        before do
          $stdin = StringIO.new('2')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(1)
          game.bot_input
          expect do
            game.results.to output('Вы проиграли!')
          end
        end
      end

      context 'paper-scissor' do
        before do
          $stdin = StringIO.new('3')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(2)
          game.bot_input
          expect do
            game.results.to output('Вы проиграли!')
          end
        end
      end

      context 'rock-paper' do
        before do
          $stdin = StringIO.new('1')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(3)
          game.bot_input
          expect do
            game.results.to output('Вы проиграли!')
          end
        end
      end
    end

    context 'draw' do
      context 'rock-rock' do
        before do
          $stdin = StringIO.new('1')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(1)
          game.bot_input
          expect do
            game.results.to output('Ничья!')
          end
        end
      end

      context 'scissor-scissor' do
        before do
          $stdin = StringIO.new('2')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(2)
          game.bot_input
          expect do
            game.results.to output('Ничья!')
          end
        end
      end

      context 'paper-paper' do
        before do
          $stdin = StringIO.new('3')
        end

        it 'return wins to user' do
          game.user_input
          expect(game).to receive(:rand).and_return(3)
          game.bot_input
          expect do
            game.results.to output('Ничья!')
          end
        end
      end
    end
  end
end
