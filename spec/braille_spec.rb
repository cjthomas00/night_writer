require 'spec_helper'

RSpec.describe Braille do 
  before (:each) do 
    @braille = Braille.new
  end

  describe '#initialzie' do
    it 'exists' do
      expect(@braille).to be_instance_of(Braille)
    end

    it 'has an alphabet' do
      alphabet = {
        a: ["O.","..",".."],
        b: ["O.","O.",".."],
        c: ["OO","..",".."],
        d: ["OO",".O",".."],
        e: ["O.",".O",".."],
        f: ["OO","O.",".."],
        g: ["OO","OO",".."],
        h: ["O.","OO",".."],
        i: [".O","O.",".."],
        j: [".O","OO",".."],
        k: ["O.","..","O."],
        l: ["O.","O.","O."],
        m: ["OO","..","O."],
        n: ["OO",".O","O."],
        o: ["O.",".O","O."],
        p: ["OO","O.","O."],
        q: ["OO","OO","O."],
        r: ["O.","OO","O."],
        s: [".O","O.","O."],
        t: [".O","OO","O."],
        u: ["O.","..","OO"],
        v: ["O.","O.","OO"],
        w: [".O","OO",".O"],
        x: ["OO","..","OO"],
        y: ["OO",".O","OO"],
        z: ["O.",".O","OO"],
        space: ["..","..",".."]
      }
      expect(@braille.alphabet).to eq(alphabet)
    end
  end

  describe '#braille_translator' do
    it 'converts a letter to braille equivalent' do
      # a = "O.\n..\n.."
      # expect(@braille.braille_translator("a")).to eq(a)

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
      expect(@braille.braille_translator(hello_world_untranslatted)).to eq(hello_world_translatted)
    end
  end
end