# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is valid with a text' do
      project = Project.create(name: 'Test Project')
      comment = Comment.new(text: 'Test Project', project_id: project.id)
      expect(comment).to be_valid
    end

    it 'is invalid without a name' do
      project = Project.create(name: 'Test Project')
      comment = Comment.new(project_id: project.id)
      expect(comment).to_not be_valid
    end
  end
end
