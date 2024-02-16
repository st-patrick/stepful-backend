class CreateSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :slots do |t|
      t.timestamp :start_time
      t.belongs_to :coach, null: false, foreign_key: true
      t.references :student, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
