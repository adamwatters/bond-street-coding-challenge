class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.belongs_to :step_sequence
      t.string :name
      t.boolean :is_complete, default: false
      t.integer :position
    end
  end
end
