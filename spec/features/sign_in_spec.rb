# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

describe 'the signin process', type: :feature do
  before { User.create!(email: 'test@example.com', password: 'password123') }

  it 'signs me in and signs me out' do
    expect(User.count).to eq(1)
    visit '/'

    within('.form-signin') do
      fill_in 'Email address', with: 'test@example.com'
      fill_in 'Password', with: 'password123'
      click_button 'Sign in'
    end

    expect(User.count).to eq(1)
    expect(page).to have_content 'Welcome#index'

    within("#appNavbar") do
      click_link 'Sign out'
    end

    within("#appNavbar") do
      expect(page).to have_content('Sign up')
    end
  end
end
