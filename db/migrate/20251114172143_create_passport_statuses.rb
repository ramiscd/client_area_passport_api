class CreatePassportStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :passport_statuses do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name
      t.boolean :current

      t.timestamps
    end
  end
end
