Rails.application.config.middleware.use OmniAuth::Builder do
  provider "1060558194293395", "4c81e971a6f9622e50d41809c5c7d2eb",
           {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end
