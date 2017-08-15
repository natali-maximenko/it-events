require 'rails_helper'

RSpec.describe Organizer, type: :model do
  context 'empty organizer' do
    subject { build(:empty_organizer) }
    it { is_expected.not_to be_valid }
  end

  context 'normal organizer' do
    subject { build(:organizer) }
    it { is_expected.to be_valid }
  end
end
