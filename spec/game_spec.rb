require './lib/game'

describe Game do
  context 'initialize game ' do
    game = Game.new('yes', '25-05-2021', '12-06-2020', archived: true, id: 502)

    it 'Should return ' do
      expect(game.can_be_archived?).to be false
    end
  end
end
