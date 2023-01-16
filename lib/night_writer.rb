class NightWriter 
  attr_reader :message_file,
              :braille_file
          
  def initialize(info)
    @message_file = info[:message_file]
    @braille_file = info[:braille_file]
  end

  def creation_message
    "Created #{@braille_file} containing #{@message_file.chars.size} characters"
  end
end

info = { 
  message_file: ARGV[0],
  braille_file: ARGV[1]
}

night_writer = NightWriter.new(info)
p night_writer.creation_message