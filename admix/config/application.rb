config.assets.paths << "#{ Rails.root }/app/assets/bootstrap"
config.assets.paths << "#{ Rails.root }/app/assets/tipsy"
config.assets.paths << "#{ Rails.root }/app/assets/nicedit"

config.i18n.default_locale = "pt-BR"

#4. If you are deploying Rails 3.1 on Heroku, you may want to set:
#
#  config.assets.initialize_on_precompile = false
#
# On config/application.rb forcing your application to not access the DB
# or load models when precompiling your assets.
