class NightWriter 
  attr_reader :message,
              :braille
          
  def initialize(info)
    @message = info[:message]
    @braille = info[:braille]
  end

  def creation_message
    "Created #{@braille} containing #{@message.chars.size} characters"
  end
end

info = { 
  message: ARGV[0],
  braille: ARGV[1]
}

night_writer = 
NightWriter.new(info)
p night_writer.creation_message