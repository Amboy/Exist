# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_amsblog_session',
  :secret      => '49a747854502b651188696cf153c11a4403e65bc8c3eea07161d3dbac4498b23640ac93d0a92b524fac643b25bae182c3e7fe0e136563e3baceb122c8cc6e165'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
