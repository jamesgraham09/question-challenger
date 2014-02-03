class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy do
    def correct
      where(correct: true).first
    end
  end

  def answer
    answers.correct && answers.correct.text
  end

  def answer=(ans_text)
    answers << Answer.create(text: ans_text, correct: true)
  end

  def wrongs
    answers && answers.where(correct:false).map(&:text).join(',')
  end

  def wrongs=(ans_text)
    puts 'AAAAAAAAAAAAAAAAAAAAA'
    puts ans_text
    ans_text.split(',').each do |ans|
      puts ans
      answers << Answer.create(text: ans.strip, correct: false)
    end
  end
end
