require 'rails_helper'

describe 'create event' do
  let!(:user) { Organizer.create!(name: 'test', email: "admin@test.me", password: "paSsWodD", description: 'test') }

  before(:each) do
    login('admin@test.me', 'paSsWodD')
    visit new_admin_event_path
    fill_in :event_title, with: 'GDG South Devfest'
    fill_in :event_description, with: 'Самое запоминающееся событие Юга России в сфере IT!'
    fill_in :event_address, with: 'г Ростов-на-Дону, пл Гагарина, д 1'
    fill_in :event_link, with: 'https://goo.gl/VRdbmk'
    fill_in :event_remote_cover_url, with: 'https://it61.info/uploads/event/cover/204/cover.png'
    click_button('Создать')
    visit events_path
  end

  it 'contain new card in list' do
    expect(page).to have_content 'GDG South Devfest'
  end

  it 'new card have right address' do
    expect(page).to have_content 'г Ростов-на-Дону, пл Гагарина, д 1'
  end

  it 'new card have cover' do
    expect(page).to have_xpath "//img[contains(@src, 'cover.png')]"
  end
end
