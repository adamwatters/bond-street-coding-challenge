class StepSequence < ActiveRecord::Base
  belongs_to :user
  has_many :steps, dependent: :destroy
  after_create :create_steps
end

private

def create_steps
  (0..4).each_with_index do |index|
    self.steps.create({position: index, name: "#{index + 1}"})
  end
end
