class Recomendation < ApplicationRecord
  belongs_to :place
  belongs_to :recomend, polymorphic: true
end
