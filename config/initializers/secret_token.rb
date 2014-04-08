# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
HosApp::Application.config.secret_token = 'e79e6ad8a5cf94ea480cc4a334cb868ea147fe4343088f66d17193843b8b4fbef29f252a2bd156293263bbd44c5d87dac434b6da48fe99ce9d98e741cacbf592'
