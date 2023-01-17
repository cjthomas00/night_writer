require './lib/translator'

class NightReader
  attr_reader :message_file,
              :braille_file

  def initialize(info)
    @message_file = info[:message_file]
    @braille_file = info[:braille_file]
  end

  def creation_message
    character_count = File.read(@braille_file).chars.size
    "Created #{@message_file} containing #{character_count} characters"
  end

  def write_contents
    message_contents = File.read(@braille_file)
    File.open(@message_file, "w") { |file| file.write(message_contents) }
    File.read(@message_file)
  end

  def convert_to_english
    translator = Translator.new
    multi_line_braille = Hash.new {|k,v| k[v] = [] }
    braille_in_lines = File.readlines(@message_file).each_slice(3).to_a
    braille_in_lines.each do |lines|
       multi_line_braille[1] << lines[0].delete("\n")
       multi_line_braille[2] << lines[1].delete("\n")  
       multi_line_braille[3] << lines[2].delete("\n")  
      end  
    single_line = [multi_line_braille[1].join, multi_line_braille[2].join, multi_line_braille[3].join]

    columns = single_line.map do |line|
      line.scan(/.{2}/)    # <== creates array with 2 character substrings ["O."] from braille_in_lines, and makes them columns instead of rows.
      end
    braille_letters = columns[0].zip(columns[1],columns[2]) #<== .zip combines the braille letter into 3 element array that will represent 1 braille letter.
    english_letter = braille_letters.map do |letter|
      translator.braille_to_english_alphabet[letter]  # <== goes over the braille to english alphabet and turns braille into english word. 
      end 
    english_letter.join  #<== combines ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"] into "hello world"
  end

  def print_english_to_file(english)
    english = convert_to_english
    File.open(@message_file, "w") { |file| file.write(english) }
    File.read(@message_file)
  end
end