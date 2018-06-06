class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title,        presence: true
  validates :content_url,  presence: true
  validates :state,        inclusion: { in: ['draft', 'published'] }
  validates :published_at, presence: true, if: :published?

  self.per_page = 10

  def published?
    state == 'published'
  end

  #
  # Fetches the content from the github
  #
  def content
    @content = @content || Octokit.contents("ethirajsrinivasan/blogs",
                     path: content_url,
                     accept: 'application/vnd.github.v3.html')
  end
end
