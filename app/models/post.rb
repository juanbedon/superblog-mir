# == Schema Information
#
# Table name: posts
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  body             :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  user_id          :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :user

	validates :body, presence: true, length: { minimum: 250 }
	validates :title, presence: true
	validates :banner_image_url, presence: true

	PER_PAGE = 6

	scope :most_recent, -> { order(published_at: :desc) }
	scope :published, -> { where(published: true) }
	scope :list_for, -> (page) do
		most_recent.paginate(:page => page, per_page: PER_PAGE)
	end

	def should_generate_new_friendly_id?
		title_changed?
	end

	def display_day_published
		if published_at.present?
			"Published #{published_at.strftime('%-b %-d, %Y')}"
		else
			"• Not published yet •"
		end
	end

	def publish
		update(published: true, published_at: Time.now)
	end

	def unpublish
		update(published: false, published_at: nil)
	end

end