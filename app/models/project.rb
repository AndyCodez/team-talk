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
class Project < ApplicationRecord
    validates :name, presence: true
    has_many :comments

    enum status: [:todo, :ongoing, :done]
end
