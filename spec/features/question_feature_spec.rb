require 'spec_helper'

describe 'answering a question' do
  specify 'correctly' do
    answer = create(:answer)
    create(:question, answers: [answer])
    visit '/'
    fill_in 'Answer', with: '2'
    click_button 'Submit'
    expect(page).to have_content 'Correct'
  end

  specify 'wrongly' do
    answer = create(:answer)
    create(:question, answers: [answer])
    visit '/'
    fill_in 'Answer', with: '3'
    click_button 'Submit'
    expect(page).to have_content 'Wrong Answer'
  end
end
