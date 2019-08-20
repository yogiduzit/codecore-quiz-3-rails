# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
# Rails.application.config.action_controller.forgery_protection_origin_check = false

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['example.com', 'localhost:8080']

      resource(
        # allow access to only paths that begin with /api/
        "*",
        # this allows all HTTP headers to be sent
        headers: :any,
        # Allows sharing of cookies for CORS requests made to this resource
        credentials: true,
        # define the HTTP verbs which are allowed in a request
        methods: [:get, :post, :delete, :patch, :put, :options]
      )
  end
end
