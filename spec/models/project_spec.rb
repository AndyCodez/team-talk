# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer          default("todo")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      project = Project.new(name: 'Test Project')
      expect(project).to be_valid
    end

    it 'is invalid without a name' do
      project = Project.new
      expect(project).to_not be_valid
    end
  end

  describe "associations" do 
    it "has many comments" do 
      project = Project.reflect_on_association(:comments)
      expect(project.macro).to eq(:has_many)
    end
  end
end
