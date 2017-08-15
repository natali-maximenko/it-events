RSpec.describe Event, type: :model do
  context 'empty event' do
    subject { build(:event, title: 'My first event', description: '', cover: '', started_at: '', link: '') }
    it { is_expected.not_to be_valid }
  end

  context 'normal event' do
    subject { build(:event) }
    it { is_expected.to be_valid }
  end

  context '#filter' do
    subject { Event.filter(attrs) }
    let(:event1) { create(:event) }
    let(:event2) { create(:event, started_at: Time.now + 6.days) }
    let(:event3) { create(:event, started_at: Time.now, address: 'Москва') }
    let(:organizer) { create :organizer_with_evens }
    before do
      date = Date.today
      time = Time.local(date.year, date.month, date.day, 10, 0, 0)
      Timecop.freeze(time)
    end

    context 'when started from today' do
      let(:attrs) do { start_date: Date.today } end
      it { is_expected.to all satisfy('starts today or later') { |e| e.start_date >= Date.today } }
    end

    context 'when started earlier then today and in rostov ' do
      let(:attrs) do { end_date: Date.today, address: 'Ростов-на-Дону' } end
      it { is_expected.to all satisfy('starts today or later') { |e| e.end_date <= Date.today and e.address.include?('Ростов-на-Дону') } }
    end

    context 'when organizer' do
      let(:attrs) do { organizer: 'Name' } end
      it { is_expected.to all satisfy('named organizer') { |e| e.organizer.name == 'name' } }
    end
  end
end
