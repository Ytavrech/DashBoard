class AddExperienceToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :experience, :integer
    add_column :jobs, :salary, :integer
  end
end
