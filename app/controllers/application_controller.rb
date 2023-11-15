class ApplicationController < ActionController::Base
    before_action :set_locale
    private
    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end
    def extract_locale
        "he"
    end
end
