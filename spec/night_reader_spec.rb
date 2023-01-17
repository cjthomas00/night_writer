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
end