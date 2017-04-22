OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1041785073810-m53ljgfbpjljs0t33p3kofa56ou8e982.apps.googleusercontent.com', 'YDqyUlwic3q1T7AKw3ULd8Hi', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end