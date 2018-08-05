require "rails"

module KolideconsHelper
  class Railtie < Rails::Railtie
    initializer "kolidecons_helper.helper" do
      ActionView::Base.send :include, KolideconsHelper
    end
  end
end
