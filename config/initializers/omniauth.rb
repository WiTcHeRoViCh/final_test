Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'DtkMydbOtwjHPsnUZ06PGzNOD', 'PgC5hwj3Noho18ZqEcZ2D1jGP2ZGg4rGdqkRBV799lekIZycLG', {scope: 'email'}
end