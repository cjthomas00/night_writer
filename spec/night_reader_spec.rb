require 'spec_helper'

RSpec.describe NightReader do
  before (:each) do
    information = {
      message_file: 'message.txt',
      braille_file: 'braille.txt'
    }
    @night_reader = NightReader.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_reader).to be_instance_of(NightReader)
    end

    it 'has a message' do
      expect(@night_reader.message_file).to eq('message.txt')
    end

    it 'has braille' do
      expect(@night_reader.braille_file).to eq('braille.txt')
    end
  end

  describe '#creation_message' do
    it 'has a message containing details on the files' do
      expect(@night_reader.creation_message).to eq("Created message.txt containing 69 characters")
    end
  end

  describe '#write_contents' do
    it 'copies the message to the braille file' do
      hello_world = "O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...\n"
      expect(@night_reader.write_contents).to eq(hello_world)
    end
  end

  describe '#convert_to_english' do 
    it 'converts braille to English' do
      braille = "O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...\n"
      expect(@night_reader.convert_to_english).to eq('hello world')
    end
  end

  describe '#print_english_to_file' do
    it 'prints the message in English' do
      expect(@night_reader.print_english_to_file(@night_reader.convert_to_english)).to eq('hello world')
    end
  end
end