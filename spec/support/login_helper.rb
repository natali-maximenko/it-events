def login(email, password)
  visit new_organizer_session_path
  fill_in :organizer_email, with: email
  fill_in :organizer_password, with: password
  click_button "Войти"
end
