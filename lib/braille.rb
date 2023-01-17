class Braille
  attr_reader :alphabet

  def initialize
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
      @alphabet = alphabet
  end

  def braille_translator(english_text)
    braille_rows = {
      first_row: [],
      second_row: [],
      third_row: []
    }

    english_text.each do |letter|
      braille_rows[:first_row] << letter[0]
      braille_rows[:second_row] << letter[1]
      braille_rows[:third_row] << letter[2]
    end
    braille_rows[:first_row].join+"\n"+braille_rows[:second_row].join+"\n"+braille_rows[:third_row].join+"\n"
  end
end