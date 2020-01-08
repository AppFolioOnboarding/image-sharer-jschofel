class Image < ApplicationRecord
  validates :url, presence: true
  validate :valid_url

  def valid_url
    return if url.start_with?('https://')
    return if url.start_with?('http://')

    errors.add(:url, 'Invalid URL')
  end
end
