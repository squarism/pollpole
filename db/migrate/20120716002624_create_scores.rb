class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.float :time
      t.string :racer
      t.string :judge

      t.timestamps
    end
  end
end
