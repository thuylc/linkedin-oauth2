require 'faraday'

module LinkedInOauth2
  class RaiseError < Faraday::Response::RaiseError
    def on_complete(response)
      status_code = response.status.to_i
      if status_code == 403 && response.body =~ /throttle/i
        raise LinkedInOauth2::ThrottleError
      else
        super
      end
    end
  end
end

Faraday::Response.register_middleware :linkedin_raise_error => LinkedInOauth2::RaiseError
