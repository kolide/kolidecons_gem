# Kolidecons gem

> Kolidecons gem to distribute kolidecons svg (https://github.com/kolide/kolidecons)

## Install

Add this to your `Gemfile`

```rb
gem 'kolidecons'
```

Then `bundle install`.

## Usage

### Rails Helper

This rails helper let's you easily include svg Kolidecons in your rails apps.

### Install

```rb
<%= kolidecon "alert", :height => 32,  :class => "right left", :"aria-label" => "hi" %>
```

The minimum CSS you'll need in your rails app is in the [kolide][kolidecons] repository. You can also npm install that package and include `build/kolidecons.css` in your styles.


```rb
require 'kolidecons'
icon = Kolidecons::Kolidecon.new("x")
icon.to_svg
# <svg class="kolidecon kolidecon-x" viewBox="0 0 16 16" width="16" height="16" version="1.1" "aria-hidden"="true"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
```

## Documentation

The `Kolidecon` class takes two arguments. The first is the symbol of the icon, and the second is a hash of arguments representing html attributes

#### `symbol` _(required)_

This is the name of the kolidecon you want to use. For example `alert`. [Full list of icons][kolidecons-docs]

#### Options

* `:height` - When setting the height to a number, the icon will scale to that size. For example, passing `32`, will calculate the width based on the icon's natural size.
* `:width` - When setting the width to a number, the icon will scale to that size. For example, passing `32`, will calculate the width based on the icon's natural size.

If both `:width, :height` are passed into the options hash, then the icon will be sized exactly at those dimensions.

#### Attributes

Once initialized, you can read a few properties from the icon.

##### `symbol`

Returns the string of the symbol name

```rb
icon = Kolidecons::Kolidecon.new("x")
icon.symbol
# "x"
```

##### `path`

Path returns the string representation of the path of the icon.

```rb
icon = Kolidecons::Kolidecon.new("x")
icon.path
# <path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path>
```

##### `options`

This is a hash of all the `options` that will be added to the output tag.

```rb
icon = Kolidecons::Kolidecon.new("x")
icon.options
# {:class=>"kolidecon kolidecon-x", :viewBox=>"0 0 12 16", :version=>"1.1", :width=>12, :height=>16, :"aria-hidden"=>"true"}
```

##### `width`

Width is the icon's true width. Based on the svg view box width. _Note, this doesn't change if you scale it up with size options, it only is the natural width of the icon_

##### `height`

Height is the icon's true height. Based on the svg view box height. _Note, this doesn't change if you scale it up with size options, it only is the natural height of the icon.

#### Methods

##### `to_svg`

Returns a string of the svg tag

```rb
icon = Kolidecons::Kolidecon.new("x")
icon.to_svg
# <svg class="kolidecon kolidecon-x" viewBox="0 0 16 16" width="16" height="16" version="1.1" "aria-hidden"="true"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
```

##### `to_svg_use`

Returns a string of the svg tag

```rb
icon = Kolidecons::Kolidecon.new("x")
icon.to_svg_use
# <svg class="kolidecon kolidecon-x" viewBox="0 0 16 16" width="16" height="16" version="1.1" "aria-hidden"="true"><use xlink:href="#x" /></svg>
```

##### `sprite_sheet`

The Kolidecons class has a method that will output the svg sprite sheet that you can inline in your app.

```rb
Kolidecons.sprite_sheet
# <svg xmlns="http://www.w3.org/2000/svg"><symbol viewBox="0 0 16 16" id="alert">...</svg>
```

## Development

If you need to add more icons to this gem, first follow the steps outlined in the kolidecons repo: https://github.com/kolide/kolidecons#changing-adding-or-deleting-icons. 
Once that is complete, copy the files from the kolidecons repo at `./build/data.json` and `./build/sprite.kolidecons.svg` into the `lib/` directory of this repo.

## License

(c) 2018 Kolide, Inc.
