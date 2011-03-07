if Rails.env == 'production'

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '177305522313642', 'e68add1520077777246d47adad8ac7f3'
  end

elsif Rails.env == 'development'
  
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '192547694099228', '96e23e469f604650aab78c26a7c9ffb9'
  end

end