# ActiveAdmin::JsonEditor

[![Gem Version](https://badge.fury.io/rb/activeadmin_json_editor.svg)](https://badge.fury.io/rb/activeadmin_json_editor)

"json_input" and "jsonb_input" field type to active_admin that allow to edit Postgresql json and jsonb values as json tree.
Data shown by using jsoneditor.js from http://jsoneditoronline.org

## Installation

Add this line to your application's Gemfile:

    gem 'activeadmin_json_editor', '~> 0.0.6'

And then execute:

    $ bundle

Include styles in "active_admin" initializer

    config.register_stylesheet 'active_admin/json_editor.css'

Include javascripts in "active_admin" initializer

    config.register_javascript 'active_admin/json_editor.js'

## Usage

This Gem provides you formtastic input called :json to edit json data and parse form data for store it


```ruby
ActiveAdmin.register User do
	permit_params :settings

	json_editor

  # specify the type does not necessarily
	form do |f|
    f.inputs do
      f.input :settings, as: :json
      f.input :other_settings, as: :jsonb
    end

    f.actions
  end
end
```

## Contributing

1. Fork it ( http://github.com/udacity/activeadmin_json_editor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
