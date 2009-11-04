# in config/initializer/locale.rb

# Diz onde procurar as traducoes
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'lib', 'locale', '*.{rb,yml}') ]

# Define a linguagem padrao
I18n.default_locale = "pt-BR"