module AdminAuthConcern 
    extend ActiveSupport::Concern
    included do
        before_action :admin_authenticate
    end
    def admin_authenticate
        authenticate_or_request_with_http_basic do |username, password|
            username == ENV["ADMIN_NAME"] && password == ENV["ADMIN_PASSWORD"]
        end
    end
end 