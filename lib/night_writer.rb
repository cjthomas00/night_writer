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
end

info = { 
  message_file: ARGV[0],
  braille_file: ARGV[1]
}

night_writer = NightWriter.new(info)
p night_writer.creation_message