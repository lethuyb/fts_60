class Question < ActiveRecord::Base
  enum state: [:waitting, :accepted]
  enum question_type: [:single, :multiple, :text]

  belongs_to :user
  belongs_to :subject
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
end
