class Comment < ApplicationRecord
  belongs_to :place
  belongs_to :commentable, polymorphic: true
end
