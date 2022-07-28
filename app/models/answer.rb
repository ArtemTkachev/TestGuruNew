class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_only, -> { where(correct: true) }
  validates :body, presence: true
  validate :check_max_number_of_answers

  private

  def check_max_number_of_answers
    errors.add(:base, 'The limit of answers to the question has been reached') if question.answers.count >= 4
  end
end
