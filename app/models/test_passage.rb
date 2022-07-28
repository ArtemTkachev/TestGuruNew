class TestPassage < ApplicationRecord
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id
  belongs_to :user
  belongs_to :test

  before_validation :before_validation_set_first_question, on: :create

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end