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
    message_contents = 
    File.read(@message_file)
      File.open(@braille_file, "w") { |file| file.write(message_contents) }
    File.read(@braille_file)
  end

  def convert_to_braille
    @braille_alphabet = Braille.new
    untranslated_braille = write_contents.chars.map do |letter|
      if letter == " "
        braille_letter = @braille_alphabet.alphabet[:space]
      else letter = 
        braille_letter = @braille_alphabet.alphabet[letter.to_sym]
      end
    end

    @braille_alphabet.braille_translator(english_text)
  end

  def print_braille_to_file(braille)
    braille = convert_to_braille
    File.open(@braille_file_path, "w") { |file| File.write(braille)}
    File.read(@braille_file_path)
  end
end

info = { 
  message_file: ARGV[0],
  braille_file: ARGV[1]
}

night_writer = NightWriter.new(info)
p night_writer.creation_message
# night_writer.write_contents
# braille = night_writer.convert_to_braille
# night_writer.print_braille_to_file(braille)