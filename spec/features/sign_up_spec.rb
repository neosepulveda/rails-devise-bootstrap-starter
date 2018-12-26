# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

describe 'the signup process', type: :feature do
  it 'signs me up' do
    expect(User.count).to eq(0)
    visit '/'

    within("#appNavbar") do
      click_link 'Sign up'
    end

    within('#new_user') do
      fill_in 'Email address', with: 'test@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Re-type password', with: 'password123'
      click_button 'Sign up'
    end

    expect(User.count).to eq(1)
    expect(page).to have_content 'Welcome#index'
  end
end
