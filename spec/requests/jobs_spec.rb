require 'rails_helper'

describe 'Job API', type: :request do
    it 'returns all Job' do
        # FactoryBot.create(:job, title: "xyz", company: "abc",experience: 1,salary: 3000)
        job = FactoryBot.create(:job)

        expect(job.title).to be_valid
    end
end