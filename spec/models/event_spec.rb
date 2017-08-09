RSpec.describe Event, type: :model do
  context 'empty event' do
    subject { Event.new(title: 'My first event', description: '', cover: '', started_at: '', link: '') }
    it { is_expected.not_to be_valid }
  end
end
