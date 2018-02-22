#!/usr/bin/env ruby

require 'json'
require 'vault'

Vault.configure do |config|
  # The address of the Vault server, also read as ENV["VAULT_ADDR"]
  config.address = 'xxxx' # ENV['vault_address']

 # The token to authenticate with Vault, also read as ENV["VAULT_TOKEN"]
  config.token = 'xxxxxx' # ENV['vault_token']
end
identifier = 'xxxx'
revisions = Vault.logical.list("secret/config/v1/#{identifier}")
revisions_meta = []
revisions.each { |rev|
  secret = Vault.logical.read("secret/config/v1/#{identifier}/#{rev}")
  if secret.data.has_key?(:metadata)
    revisions_meta << JSON.parse(secret.data[:metadata])
  end
}
revisions_meta.sort_by!{ |hsh| hsh['timestamp'] }.reverse!

revisions_meta.each{|rev|
  p rev
}
