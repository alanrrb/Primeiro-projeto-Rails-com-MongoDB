# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teste_mongo3_session',
  :secret      => 'f79dfb74e3b325c0d1a0468f9a6241ce46b46faba2a19f8af8aa6a479de6390ac2dc0ca64b5ca7c23d9709e70fbeb45f3de0c27ea0dc7a392e0b1531a6736b3b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
