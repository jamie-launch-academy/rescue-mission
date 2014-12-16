class Question < ActiveRecord::Base
  validates :title, presence: true,
              length: { minimum: 10 }
  validates :description, presence: true,
                length: { minimum: 50 }
end
