#!/usr/bin/env ruby

require "awesome_print"
require 'json'
require 'neatjson'
require 'vault'
require 'pp'
require 'yaml'

Vault.configure do |config|
  # The address of the Vault server, also read as ENV["VAULT_ADDR"]
  config.address = 'xxxxxx' # ENV['vault_address']

 # The token to authenticate with Vault, also read as ENV["VAULT_TOKEN"]
  config.token = 'xxxxxx' # ENV['vault_token']
end

rev =  'xxxxx'
identifier = 'xxxx'
secret = Vault.logical.read("secret/config/v1/#{identifier}/#{rev}")
bla = JSON.parse(secret.data[:data])
 ap(bla)
#p ap(bla)

