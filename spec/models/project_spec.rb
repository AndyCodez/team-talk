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
end
