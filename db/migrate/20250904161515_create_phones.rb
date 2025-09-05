class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.references :user, null: false, foreign_key: true
      t.string :number
      t.string :kind

      t.timestamps
    end
  end
end
