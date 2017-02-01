class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_one :step_sequence, dependent: :destroy
  has_many :steps, through: :step_sequence
  after_create :create_sequence
end

def create_sequence
  step_sequence.create
end
