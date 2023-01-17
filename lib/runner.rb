require './spec/spec_helper'

info = { 
  message_file: ARGV[0],
  braille_file: ARGV[1]
}
night_writer = NightWriter.new(info)
p night_writer.creation_message
night_writer.write_contents
braille = night_writer.convert_to_braille
night_writer.print_braille_to_file(braille)