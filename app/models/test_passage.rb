class TestPassage < ApplicationRecord
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true
  belongs_to :user
  belongs_to :test

  before_validation :before_validation_set_question, on: [:create, :update]

  SUCCESS_PERCENTAGE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_num
    return test_questions_order.index(current_question) + 1 if current_question.present?

    0
  end

  def questions_total_number
    self.test.questions.count
  end

  def passage_success?
    rate_of_completed_questions >= SUCCESS_PERCENTAGE
  end

  def rate_of_completed_questions
    questions_tn = questions_total_number
    return (correct_questions / questions_tn) * 100 if questions_tn > 0

    0
  end

  private

  def before_validation_set_question
    self.current_question = self.current_question.nil? ? test_questions_order.first : next_question
  end

  def test_questions_order
    self.test.questions.order(:id)
  end

  def correct_answer?(answer_ids)
    answer_ids.present? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct_only
  end

  def next_question
    test_questions_order.where('id > ?', current_question.id).first
  end
end
