require 'spec_helper'

describe 'answering a question' do
  specify 'correctly' do
    create(:question, text: '1 + 1')
    visit '/'
    fill_in 'answer', with: '2'
    press 'submit'
    expect(page).to have_content 'correct'
  end
end
