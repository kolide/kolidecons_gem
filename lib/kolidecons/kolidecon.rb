module Kolidecons
  class Kolidecon

    attr_reader :path, :options, :width, :height, :symbol

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      if kolidecon = Kolidecons::KOLIDECON_SYMBOLS[@symbol]

        @path = kolidecon["path"]
        @width = kolidecon["width"].to_i
        @height = kolidecon["height"].to_i

        @options = options
        @options.merge!({
          :class   => classes,
          :viewBox => viewbox,
          :version => "1.1"
        })
        @options.merge!(size)
        @options.merge!(a11y)
      else
        raise "Couldn't find kolidecon symbol for #{@symbol.inspect}"
      end
    end

    # Returns an string representing a <svg> tag
    def to_svg
      "<svg #{html_attributes}>#{@path}</svg>"
    end

    # Returns a string representing a <svg> use tag
    # For use with spritesheets
    def to_svg_use
      "<svg #{html_attributes}><use xlink:href=\"##{@symbol}\" /></svg>"
    end

    private

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    # add some accessibility features to svg
    def a11y
      accessible = {}

      if @options[:'aria-label'].nil?
        accessible[:'aria-hidden'] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    # prepare the kolidecon class
    def classes
      "kolidecon kolidecon-#{@symbol} #{@options[:class]} ".strip
    end

    def viewbox
      "0 0 #{@width} #{@height}"
    end

    # determine the height and width of the kolidecon based on :size option
    def size
      size = {
        :width => @width,
        :height => @height
      }

      # Specific size
      unless @options[:width].nil? && @options[:height].nil?
        size[:width]  = @options[:width].nil?  ? calculate_width(@options[:height]) : @options[:width]
        size[:height] = @options[:height].nil? ? calculate_height(@options[:width]) : @options[:height]
      end

      size
    end

    def calculate_width(height)
      (height.to_i * @width) / @height
    end

    def calculate_height(width)
      (width.to_i * @height) / @width
    end
  end
end
