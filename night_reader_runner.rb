require './spec/spec_helper'

info = { 
  braille_file: ARGV[0],
  message_file: ARGV[1]
  }
night_reader = NightReader.new(info)
p night_reader.creation_message
night_reader.write_contents
english = night_reader.convert_to_english
night_reader.print_english_to_file(english)