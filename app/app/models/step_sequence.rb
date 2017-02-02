class StepSequence < ActiveRecord::Base
  belongs_to :user
  has_many :steps, dependent: :destroy
  after_create :create_steps

  def has_step_at(index)
    index >= 0 && index <= steps.length - 1
  end

  def can_reach(step)
    puts step
    step.position <= first_reachable.position
  end

  def first_reachable
    steps.find do |s|
      !s.is_complete || s.position === steps.length - 1
    end
  end

  private

  def create_steps
    (0..4).each_with_index do |index|
      steps.create({position: index, name: "Step #{index + 1}"})
    end
  end

end
