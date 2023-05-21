class Spree::Video < ApplicationRecord

  validates :name, presence: true
  validates :vimeo_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
