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
class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :project
  belongs_to :user

  def author
    user.name || "User #{user.id}"
  end
end
