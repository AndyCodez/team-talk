# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is valid with a text, project, and user' do
      project = Project.create(name: 'Test Project')
      user = User.create(name: 'Test Project', email: "example@example.com", role: 1)

      comment = Comment.new(text: 'Test Project', project_id: project.id, user_id: user.id)
      expect(comment).to be_valid
    end

    it 'is invalid without a text' do
      project = Project.create(name: 'Test Project')
      user = User.create(name: 'Test Project', email: "example@example.com", role: 1)

      comment = Comment.new(project_id: project.id, user_id: user.id)
      expect(comment).to_not be_valid
    end
  end
end
