class URLValidator < ActiveModel::Validator
  def validate(record)
    return if record.url.start_with?('https://')
    return if record.url.start_with?('http://')

    record.errors[:base] << 'Invalid URL'
  end
end

class Image < ApplicationRecord
  include ActiveModel::Validations
  validates_with URLValidator
  validates :url, presence: true
end
