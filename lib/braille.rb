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
        z: ["O.",".O","OO"]
      }
      @alphabet = alphabet
  end

  def braille_translator(letter)
    @alphabet[letter.to_sym].join("\n")
  end
end