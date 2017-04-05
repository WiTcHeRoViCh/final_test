class Place < ApplicationRecord
	has_many :recomendations, as: :recomend, dependent: :destroy
end
