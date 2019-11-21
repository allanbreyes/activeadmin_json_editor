#-*- encoding: utf-8; tab-width: 2 -*-
require 'activeadmin'

module ActiveAdmin
  class ResourceDSL
    def json_editor
      before_save do |object, _args|
        object.class.columns_hash.select { |_key, attr| attr.type.in? [:json, :jsonb] }.keys.each do |key|
          next unless params[resource_request_name].key? key
          json_data = params[resource_request_name][key]
          data = if json_data == 'null' || json_data.blank?
                   {}
                 else
                   JSON.parse(json_data)
          end
          object.attributes = { key => data }
        end
      end
    end
  end
end
