class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :lastname
      t.string :city
      t.string :phone
      t.timestamps
    end
  end
end
