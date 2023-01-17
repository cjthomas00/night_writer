require './lib/braille'

class NightWriter 
  attr_reader :message_file,
              :braille_file
          
  def initialize(info)
    @message_file = info[:message_file]
    @braille_file = info[:braille_file]
  end

  def creation_message
    character_count = File.read(@message_file).chars.size
    "Created #{@braille_file} containing #{character_count} characters"
  end

  def write_contents
    message_contents = File.read(@message_file)
    File.open(@braille_file, "w") { |file| file.write(message_contents) }
    File.read(@braille_file)
  end

  def convert_to_braille
    @braille_alphabet = Braille.new
    untranslated_braille = []
    write_contents.chars.each do |letter|
      if letter == " "
        untranslated_braille << @braille_alphabet.alphabet[:space]
      else letter = 
        untranslated_braille << @braille_alphabet.alphabet[letter.to_sym]
      end
    end

    @braille_alphabet.braille_translator(untranslated_braille)
  end

  def print_braille_to_file(braille)
    braille = convert_to_braille
    File.open(@braille_file, "w") { |file| file.write(braille) }
    File.read(@braille_file)
  end
end