require "oauth2"

require "linked_in_oauth2/errors"
require "linked_in_oauth2/raise_error"
require "linked_in_oauth2/version"
require "linked_in_oauth2/configuration"

# Responsible for all authentication
# LinkedInOauth2::OAuth2 inherits from OAuth2::Client
require "linked_in_oauth2/oauth2"

# Coerces LinkedIn JSON to a nice Ruby hash
# LinkedInOauth2::Mash inherits from Hashie::Mash
require "hashie"
require "linked_in_oauth2/mash"

# Wraps a LinkedIn-specifc API connection
# LinkedInOauth2::Connection inherits from Faraday::Connection
require "faraday"
require "linked_in_oauth2/connection"

# Data object to wrap API access token
require "linked_in_oauth2/access_token"

# Endpoints inherit from APIResource
require "linked_in_oauth2/api_resource"

# All of the endpoints
require "linked_in_oauth2/jobs"
require "linked_in_oauth2/people"
require "linked_in_oauth2/search"
require "linked_in_oauth2/groups"
require "linked_in_oauth2/companies"
require "linked_in_oauth2/communications"
require "linked_in_oauth2/share_and_social_stream"

# The primary API object that makes requests.
# It composes in all of the endpoints
require "linked_in_oauth2/api"

module LinkedInOauth2
  @config = Configuration.new

  class << self
    attr_accessor :config
  end

  def self.configure
    yield self.config
  end
end
