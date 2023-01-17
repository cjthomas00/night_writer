require 'spec_helper'

RSpec.describe NightWriter do
  before (:each) do
    information = {
      message_file: 'message.txt',
      braille_file: 'braille.txt'
    }
    @night_writer = NightWriter.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_writer).to be_instance_of(NightWriter)
    end

    it 'has a message' do
      expect(@night_writer.message_file). to eq('message.txt')
    end

    it 'has braille' do
      expect(@night_writer.braille_file).to eq('braille.txt')
    end
  end

  describe '#creation_message' do
    it 'has a message containing details on the files' do
      expect(@night_writer.creation_message).to eq("Created braille.txt containing 11 characters")
    end
  end

  describe '#write_contents' do
    it 'copies the message to the braille file' do
      expect(@night_writer.write_contents).to eq('hello world')
    end
  end

  describe '#convert_to_braille' do 
    it 'converts English to braille' do
      hello_world = "O.O.O.O.O....OO.O.O.OO\nOO.OO.O..O..OO.OOOO..O\n....O.O.O....OO.O.O...\n"
      expect(@night_writer.convert_to_braille).to eq(hello_world)
    end
  end
end