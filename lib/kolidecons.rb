require "kolidecons/version"
require "kolidecons/kolidecon"
require "kolidecons/helper"
require "kolidecons/railtie" if defined?(Rails)
require "json"

module Kolidecons
  SPRITE_SHEET = File.read(File.join(File.dirname(__FILE__), "sprite.kolidecons.svg")).freeze
  KOLIDECON_SYMBOLS = JSON.parse(File.read(File.join(File.dirname(__FILE__), "data.json"))).freeze

  def self.sprite_sheet
    SPRITE_SHEET.sub("><symbol", " style=\"width:0;height:0;visibility:hidden;\"><symbol")
  end
end
