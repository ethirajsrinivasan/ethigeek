class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title,        presence: true
  validates :content_url,  presence: true
  validates :state,        inclusion: { in: ['draft', 'published'] }
  validates :published_at, presence: true, if: :published?

  self.per_page = 9
  default_scope { order(published_at: :desc) }
  scope :published, -> {where(state: "published")}

  #
  # Fetches the content from the github
  #

  def published?
    state == "published"
  end

  def content
    Rails.cache.fetch("blog_#{title}") do
      @content = @content || Octokit.contents("ethirajsrinivasan/blogs",
                                              path: content_url,
                                              accept: 'application/vnd.github.v3.html')
      doc = Nokogiri::HTML(@content)
      doc.search('img').wrap("<div class='text-center'>")
      first_paragraph = doc.at_css 'p'
      first_paragraph.add_next_sibling("<p><div class='rvlqplr-placement-046628aa-40bc-4b18-bb04-e20223f91c38'></div></p>")
      @content = doc.to_s
    end
  end

  def short_content
    Rails.cache.fetch("blog_#{title}_short_content") do
      @content = @content || Octokit.contents("ethirajsrinivasan/blogs",
                                              path: content_url,
                                              accept: 'application/vnd.github.v3.html')
      Nokogiri::HTML(@content).css("p").first.children.text
    end
  end



  def next
    self.class.published.where('"blogs"."published_at" < ?', published_at).first
  end

  def previous
    self.class.published.where('"blogs"."published_at" > ?', published_at).last
  end

end
