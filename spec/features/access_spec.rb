require 'rails_helper'

describe 'Accessing admin panel' do
  let!(:user) { Organizer.create!(name: 'test', email: "admin@test.me", password: "paSsWodD", description: 'test') }
  before :each do
    visit admin_events_path
  end

  it 'redirect to login' do
    expect(page).to have_content 'Вам необходимо войти в систему'
  end

  it 'does not show organizer menu' do
    expect(page).not_to have_content 'Мои события'
  end

  it 'show login button' do
    expect(page).to have_content 'Войти'
  end

  context 'after login' do
    before :each do
      login('admin@test.me', 'paSsWodD')
    end

    it 'show home page' do
      expect(page).to have_content 'Вход в систему выполнен'
    end

    it 'show organizer menu' do
      expect(page).to have_content 'Добавить событие'
    end

    it 'does not show login link' do
      expect(page).not_to have_content 'Войти'
    end

    context 'profile menu' do
      before :each do
        click_on 'admin@test.me'
      end

      it 'show edit profile link' do
        expect(page).to have_content 'Редактировать профиль'
      end

      it 'show log out link' do
        expect(page).to have_content 'Выйти'
      end
    end
  end
end
