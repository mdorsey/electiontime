# Run npm install on startup
system 'npm install' if Rails.env.development? || Rails.env.test?