class Response < ActiveRecord::Base
  validates :message,
  presence: true
  validates :post_id,
  presence: true

  belongs_to :question
end
