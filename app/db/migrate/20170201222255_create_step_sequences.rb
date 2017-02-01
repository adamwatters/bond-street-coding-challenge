class CreateStepSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :step_sequences do |t|
      t.belongs_to :user
      t.integer :current_step_index, default: 0
    end
  end
end
