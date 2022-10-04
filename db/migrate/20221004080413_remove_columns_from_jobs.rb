class RemoveColumnsFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_columns :jobs, :status, default: 0, index: true
  end
end
