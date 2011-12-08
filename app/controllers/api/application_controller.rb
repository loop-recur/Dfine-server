module Api
class ApplicationController < ::ApplicationController
  layout false
  skip_before_filter :require_http_authentication
  before_filter :authenticate_user!
end
end
