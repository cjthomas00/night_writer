require 'spec_helper'

RSpec.describe Translator do 
  before (:each) do 
    @translator = Translator.new
  end

  describe '#initialzie' do
    it 'exists' do
      expect(@translator).to be_instance_of(Translator)
    end

    it 'has an alphabet' do
      alphabet = {
    "a" => ["O.","..",".."],
    "b" => ["O.","O.",".."],
    "c" => ["OO","..",".."],
    "d" => ["OO",".O",".."],
    "e" => ["O.",".O",".."],
    "f" => ["OO","O.",".."],
    "g" => ["OO","OO",".."],
    "h" => ["O.","OO",".."],
    "i" => [".O","O.",".."],
    "j" => [".O","OO",".."],
    "k" => ["O.","..","O."],
    "l" => ["O.","O.","O."],
    "m" => ["OO","..","O."],
    "n" => ["OO",".O","O."],
    "o" => ["O.",".O","O."],
    "p" => ["OO","O.","O."],
    "q" => ["OO","OO","O."],
    "r" => ["O.","OO","O."],
    "s" => [".O","O.","O."],
    "t" => [".O","OO","O."],
    "u" => ["O.","..","OO"],
    "v" => ["O.","O.","OO"],
    "w" => [".O","OO",".O"],
    "x" => ["OO","..","OO"],
    "y" => ["OO",".O","OO"],
    "z" => ["O.",".O","OO"],
    " " => ["..","..",".."]
      }
      expect(@translator.alphabet).to eq(alphabet)
    end
  end

  describe '#braille_translator' do
    it 'converts a letter to braille equivalent' do
      hello_world_untranslatted = [
      ["O.", "OO", ".."],
      ["O.", ".O", ".."],
      ["O.", "O.", "O."],
      ["O.", "O.", "O."],
      ["O.", ".O", "O."],
      ["..", "..", ".."],
      [".O", "OO", ".O"],
      ["O.", ".O", "O."],
      ["O.", "OO", "O."],
      ["O.", "O.", "O."],
      ["OO", ".O", ".."]]

      hello_world_translatted = "O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...\n"
      expect(@translator.braille_translator(hello_world_untranslatted)).to eq(hello_world_translatted)
    end

    it 'creates a new line after 40 English characters' do
      unformatted_message = [
      ["O.","..",".."],
      ["O.","O.",".."],
      ["OO","..",".."],
      ["OO",".O",".."],
      ["O.",".O",".."],
      ["OO","O.",".."],
      ["OO","OO",".."],
      ["O.","OO",".."],
      [".O","O.",".."],
      [".O","OO",".."],
      ["O.","..","O."],
      ["O.","O.","O."],
      ["OO","..","O."],
      ["OO",".O","O."],
      ["O.",".O","O."],
      ["OO","O.","O."],
      ["OO","OO","O."],
      ["O.","OO","O."],
      [".O","O.","O."],
      [".O","OO","O."],
      ["O.","..","OO"],
      ["O.","O.","OO"],
      [".O","OO",".O"],
      ["OO","..","OO"],
      ["OO",".O","OO"],
      ["O.",".O","OO"],
      ["..","..",".."],
      ["O.","..",".."],
      ["O.","O.",".."],
      ["OO","..",".."],
      ["OO",".O",".."],
      ["O.",".O",".."],
      ["OO","O.",".."],
      ["OO","OO",".."],
      ["O.","OO",".."],
      [".O","O.",".."],
      [".O","OO",".."],
      ["O.","..","O."],
      ["O.","O.","O."],
      ["OO","..","O."],
      ["OO",".O","O."],
      ["O.",".O","O."],
      ["OO","O.","O."],
      ["OO","OO","O."],
      ["O.","OO","O."],
      [".O","O.","O."],
      [".O","OO","O."],
      ["O.","..","OO"],
      ["O.","O.","OO"],
      [".O","OO",".O"],
      ["OO","..","OO"],
      ["OO",".O","OO"],
      ["O.",".O","OO"],
    ]
    message_formatted = 
    "O.O.OOOOO.OOOOO..O.OO.O.OOOOO.OOOOO..O.OO.O..OOOOOO...O.O.OOOOO.OOOOO..O.OO.O.OO\n..O....O.OO.OOOOO.OO..O....O.OO.OOOOO.OO..O.OO...O.O....O....O.OO.OOOOO.OO..O...\n....................O.O.O.O.O.O.O.O.O.O.OOOO.OOOOOOO......................O.O.O.\nOOO.OOOOO..O.OO.O..OOOOOO.\n.O.OO.OOOOO.OO..O.OO...O.O\nO.O.O.O.O.O.O.OOOO.OOOOOOO\n"
    
    expect(@translator.braille_translator(unformatted_message)).to eq(message_formatted)
    end
  end
end