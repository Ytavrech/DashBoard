require 'rails_helper'

RSpec.describe Job, type: :model do
  subject {
    described_class.new(title: "abc",
                        company: "xyz",
                        experience: 2,
                        salary: 10000,
                        user_id: 31
                        )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a company" do
    subject.company = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a experience" do
    subject.experience = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a salary" do
    subject.salary = nil
    expect(subject).to_not be_valid
  end


  # it "Job create" do
  #   job = Job.create!
  #   applicant1 = job.applicants.create!(:name => "rohit")
  #   applicant2 = post.applicants.create!(:lastname => "chouhan")
  #   expect(post.reload.applicants).to eq([applicant1, applicant2])
  # end

end
