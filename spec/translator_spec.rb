require 'spec_helper'

RSpec.describe Translator do 
  before (:each) do 
    @translator = Translator.new
  end

  describe '#initialzie' do
    it 'exists' do
      expect(@translator).to be_instance_of(Translator)
    end

    it 'has an English alphabet' do
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
      expect(@translator.english_to_braille_alphabet).to eq(alphabet)
    end

    it 'has a Braille alphabet' do
     braille_alphabet =  {
      ["O.", "..", ".."]=>"a",
      ["O.", "O.", ".."]=> "b",
      ["OO", "..", ".."]=> "c",
      ["OO", ".O", ".."]=> "d",
      ["O.", ".O", ".."]=> "e",
      ["OO", "O.", ".."]=> "f",
      ["OO", "OO", ".."]=> "g",
      ["O.", "OO", ".."]=> "h",
      [".O", "O.", ".."]=> "i",
      [".O", "OO", ".."]=> "j",
      ["O.", "..", "O."]=> "k",
      ["O.", "O.", "O."]=> "l",
      ["OO", "..", "O."]=> "m",
      ["OO", ".O", "O."]=> "n",
      ["O.", ".O", "O."]=> "o",
      ["OO", "O.", "O."]=> "p",
      ["OO", "OO", "O."]=> "q",
      ["O.", "OO", "O."]=> "r",
      [".O", "O.", "O."]=> "s",
      [".O", "OO", "O."]=> "t",
      ["O.", "..", "OO"]=> "u",
      ["O.", "O.", "OO"]=> "v",
      [".O", "OO", ".O"]=> "w",
      ["OO", "..", "OO"]=> "x",
      ["OO", ".O", "OO"]=> "y",
      ["O.", ".O", "OO"]=> "z",
      ["..", "..", ".."]=> " "
        }
      expect(@translator.braille_to_english_alphabet).to eq(braille_alphabet)
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