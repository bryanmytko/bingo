# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "copy", preload: true
pin "games_channel", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/channels", under: "channels"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.8/app/assets/javascripts/actioncable.esm.js"
