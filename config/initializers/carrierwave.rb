CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["IMAGE_ACCESS_KEY"],
    :aws_secret_access_key  => ENV["IMAGE_SECRET_KEY"],
    :region                 => 'us-west-2'
  }

  config.fog_directory = 'ohusenm7' if Rails.env.production?
  config.fog_directory = 'your_backet_for_dev' if Rails.env.development?

end
