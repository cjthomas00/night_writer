require 'spec_helper'

RSpec.describe NightWriter do
  before (:each) do
    information = {
      message_file_path: 'message_spec.txt',
      braille_file_path: 'braille_spec.txt'
    }
    @night_writer = NightWriter.new(information)
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@night_writer).to be_instance_of(NightWriter)
    end
  end
end