class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_one :step_sequence, dependent: :destroy
  after_create :create_step_sequence
end
