class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :lastname
      t.string :city
      t.string :phone
      t.references :job, null: false, foreign_key: true
      t.timestamps
    end
  end
end
