OmniAuth.config.logger = Rails.logger
require File.expand_path('lib/omniauth/strategies/demo', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :demo, '7a0b5cbb8794178111f5cfc4fc5687238dc9690de95e6365126bff516bcdbc43', 'e645f0173b5c0580994ee1e424a22ba93532ef0147a1c89616bfb08501392cd8'
end
