class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title,        presence: true
  validates :content_url,  presence: true
  validates :state,        inclusion: { in: ['draft', 'published'] }
  validates :published_at, presence: true, if: :published?

  self.per_page = 10
  default_scope { order(published_at: :desc) }
  scope :published, -> {where(state: "published")}

  #
  # Fetches the content from the github
  #

  def published?
    state == "published"
  end

  def content
    @content = @content || Octokit.contents("ethirajsrinivasan/blogs",
                     path: content_url,
                     accept: 'application/vnd.github.v3.html')
    doc = Nokogiri::HTML(@content)
    doc.search('img').wrap("<div class='text-center'>")
    @content = doc.to_s
  end

  def next
    self.class.published.where('"blogs"."published_at" < ?', published_at).first
  end

  def previous
    self.class.published.where('"blogs"."published_at" > ?', published_at).first
  end

end
