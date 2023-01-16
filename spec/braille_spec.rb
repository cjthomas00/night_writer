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
        z: ["O.",".O","OO"]
      }
      expect(@braille.alphabet).to eq(alphabet)
    end
  end
end