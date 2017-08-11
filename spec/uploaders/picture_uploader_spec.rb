require 'rails_helper'

RSpec.describe PictureUploader, type: :model do
  let(:event) { Event.new(title: 'My first event', description: '', started_at: '', link: '') }
  let(:uploader) { PictureUploader.new(event, :cover) }

  before do
    PictureUploader.enable_processing = true
    File.open("#{::Rails.root}/spec/support/fixtures/ciklon.jpg") { |f| uploader.store!(f) }
  end

  after do
    PictureUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it 'scales down a landscape image to be fit within 150 by 150 pixels' do
      expect(uploader.thumb).to be_no_larger_than(150, 150)
    end
  end

  context 'the original version' do
    it 'scales down a landscape image to fit within 400 by 400 pixels' do
      expect(uploader).to be_no_larger_than(400, 400)
    end
  end

  it 'has the correct format' do
    expect(uploader).to be_format('jpeg')
  end

end
