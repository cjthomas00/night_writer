require 'spec_helper'

RSpec.describe NightWriter do
  before (:each) do
    information = {
      message_file: 'message_spec.txt',
      braille_file: 'braille_spec.txt'
    }
    @night_writer = NightWriter.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_writer).to be_instance_of(NightWriter)
    end

    it 'has a message' do
      expect(@night_writer.message_file). to eq('message_spec.txt')
    end

    it 'has braille' do
      expect(@night_writer.braille_file).to eq('braille_spec.txt')
    end
  end

  describe '#creation_message' do
    it 'has a message containing details on the files' do
      expect(@night_writer.creation_message).to eq("Created braille_spec.txt containing 16 characters")
    end
  end
end