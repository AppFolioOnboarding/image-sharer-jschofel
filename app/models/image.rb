require 'uri'

class URLValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << 'Invalid URL' unless
        record.url.start_with?('https://') || record.url.start_with?('http://')

    #  URI.parse(record.url)
    # rescue URI::Error # triggered if invalid URI
    # record.errors[:base] << 'Invalid URL'
  end
end

class Image < ApplicationRecord
  include ActiveModel::Validations
  validates_with URLValidator
  validates :url, presence: true
end
