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
end