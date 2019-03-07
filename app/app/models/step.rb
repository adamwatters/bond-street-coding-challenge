class Step < ActiveRecord::Base
  belongs_to :step_sequence
  default_scope -> { order(position: :asc) }

  def to_param
    (position + 1).to_s
  end

  def reachable?
    self.step_sequence.can_reach(self)
  end

end
