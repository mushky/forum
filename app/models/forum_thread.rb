# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ForumThread < ApplicationRecord
  belongs_to :user
	has_many :forum_posts
	has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts # this allows for nested attributes because our routes config has forum_post nested to forum_thread

  validates :subject, presence: true
	validates_associated :forum_posts
end
