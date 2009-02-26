# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_polymorephic_notes_session',
  :secret      => 'dbc19a1f144f3f771cc4c65897614b2e5d3b85b54ba6a70cae7af6e96a9edaba33ed947351c2b2d0ec5dc7a57ce8088a8a1dd538d8ba408eea2154b11f404a8f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
