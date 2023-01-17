class Translator 
  attr_reader :english_to_braille_alphabet,
              :braille_to_english_alphabet

  def initialize
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
    @english_to_braille_alphabet = alphabet
    @braille_to_english_alphabet = alphabet.invert
  end

  def braille_translator(braille)
    braille_rows = {
      first_row: [],
      second_row: [],    
      third_row: []
    }
    braille.each do |letter|    # <=== this will go across (braille) and put the 1st, 2nd, and 3rd character into the hash above. This will make the letters vertical instead of horizontal. 
      braille_rows[:first_row] << letter[0]
      braille_rows[:second_row] << letter[1]
      braille_rows[:third_row] << letter[2]
    end
    braille_rows.each do |row, char|  # <=== this will split the hash rows key and char value from each other. 
      braille_rows[row] = char.each_slice(40).to_a # <=== This will split the char arrray above into sub-arrays of 40 characters or less.
    end
    array = []
    braille_rows.each do |row, char|
      number_of_new_lines = char.size  # <== new lines are created based off the size of the char array. If it is over 40, a new line will be added. 
      counter = 0
      array = []
      while counter < number_of_new_lines  # <== puts braille_rows into array to later be joined into a string.
        array << braille_rows[:first_row][counter].join+"\n"+braille_rows[:second_row][counter].join+"\n"+braille_rows[:third_row][counter].join+"\n"
        counter += 1
      end
    end
    array.join
  end
end