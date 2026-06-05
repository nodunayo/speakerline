Passwordless.configure do |config|
  config.default_from_address = "noreply@#{Rails.env.staging? ? "staging." : ""}speakerline.io"
end
