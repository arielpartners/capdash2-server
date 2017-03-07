Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'healthcheck' see middleware_healthcheck.rb

  get 'info', to: 'diagnostics#info'
  # CKS: to Nick this should return something like the below
  # 200
  # {
  #    name: pkg.name,
  #    version: pkg.version,
  #    description: pkg.description,
  #    host: request.hostname
  # }
end
