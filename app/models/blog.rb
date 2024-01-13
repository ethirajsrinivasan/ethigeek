require 'open-uri'
require 'fileutils'

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
  scope :tech, -> {where(blog_type: "tech")}

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
      assets_folder = Rails.root.join('app', 'assets', 'images')
      doc = download_and_replace_images(doc,assets_folder)
      doc.search('img').wrap("<div class='text-center'>")
      doc.css('blockquote').each do |blockquote|
        if blockquote.text.strip.starts_with? 'http'
          url = blockquote.text.strip
          content = HTTParty.get(blockquote.text.strip)
          meta_doc = Nokogiri::HTML(content.body)
          title = meta_doc.css('title').text.strip
          description = meta_doc.css('meta[name="description"]').present? ? meta_doc.css('meta[name="description"]').attr('content').value : ""
          image = meta_doc.css('meta[property="og:image"]').present? ? meta_doc.css('meta[property="og:image"]').attr('content').value : ""
          meta_content = get_meta_content(url,title,description.first(100),image)
          blockquote.css('a').remove
          blockquote.add_child(meta_content)
          blockquote.add_child("<br>")
        end
      end
      anchor_tags = doc.css('a')
      anchor_tags.each do |anchor_tag|
        anchor_tag['target'] = '_blank'
      end
      doc.to_s
    end
  end

  def short_content
    Rails.cache.fetch("blog_#{title}_short_content") do
      @content = @content || Octokit.contents("ethirajsrinivasan/blogs",
                                              path: content_url,
                                              accept: 'application/vnd.github.v3.html')
      Nokogiri::HTML(@content).css("p").first.children.text.strip
    end
  end



  def next
    self.class.published.where('"blogs"."published_at" < ?', published_at).where(blog_type:blog_type).first
  end

  def previous
    self.class.published.where('"blogs"."published_at" > ?', published_at).where(blog_type:blog_type).last
  end

  def get_meta_content(url,title,description,image)
    "<a href=#{url}>
        <div id='blogs' class='row justify-content-center'>
            <div class='col-md-8'>
                <div class='border'>
                    <img class='img-tile' src='#{image}'>
                    <br>
                    <div class='px-3 pt-1'>#{title}</div>
                    <div class='fw-light px-3 py-1'><small>#{description}...</small></div>
                </div>
            </div>
        </div>
    </a>"
  end

  def download_and_replace_images(doc, assets_folder)

    # Use a regular expression to match URLs with the specified domain
    url_pattern = /https:\/\/private-user-images\.githubusercontent\.com\/[^\s'"]+/

    doc.css('[src], [href]').each do |element|
      # Match the URL pattern in src or href attributes
      matches = element['src'].to_s.scan(url_pattern) + element['href'].to_s.scan(url_pattern)

      matches.flatten.each do |url|
        # Extract image file name from the URL
        image_name = "github_" + File.basename(url).split("?").first


        # Construct the destination path in the Rails assets folder
        destination_path = File.join(assets_folder, image_name)

        # Download the image and save it to the destination path
        open(destination_path, 'wb') do |file|
          file << URI.open(url).read
        end

        puts "Image downloaded and saved to #{destination_path}"

        # Update the src or href attribute with the new Rails assets path
        element['src'] = element['href'] = "/assets/#{image_name}"
      end
    end
    return doc
  end

end
