Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'abuo9mdiuhUXZTNNtr0Iw', 'PcEcJhJzphcUisyRMJxqWR5ykkC7xpo3HmylShAds'
  #provider :facebook, 'APP_ID', 'APP_SECRET'
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end