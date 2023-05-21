class Spree::Video < ApplicationRecord

  validates :name, presence: true
  validates :video_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
