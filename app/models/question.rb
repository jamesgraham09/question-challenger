class Question < ActiveRecord::Base
  has_many :answers do
    def correct
      where(correct: true).first
    end
  end

  def answer
    answers.correct
  end

end
