require 'spec_helper'

describe 'answering a question' do
  specify 'correctly' do
    question = create(:question)
    question.answers << create(:answer)
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

describe 'multiple choice questions' do
  specify 'correctly' do
    question = create(:question)
    question.answers << create(:answer, text: '3', correct: false)
    question.answers << create(:answer, text: '2', correct: true)
    visit '/'
    click_button '2'
    expect(page).to have_content 'Correct'
  end

  specify 'wrongly' do
    question = create(:question)
    question.answers << create(:answer, text: '3', correct: false)
    question.answers << create(:answer, text: '2', correct: true)
    visit '/'
    click_button '3'
    expect(page).to have_content 'Wrong'
  end
end
