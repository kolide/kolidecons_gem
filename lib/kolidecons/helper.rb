require "action_view"

module KolideconsHelper

  include ActionView::Helpers::TagHelper

  def kolidecon(symbol, options = {})
    return "" if symbol.nil?

    icon = Kolidecons::Kolidecon.new(symbol, options)
    content_tag(:svg, icon.path.html_safe, icon.options)
  end
end
