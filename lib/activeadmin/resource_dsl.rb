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
        object.nested_attributes_options.keys.each {|_nested_key|
          nested_attributes_with_index = params[resource_request_name]["#{_nested_key}_attributes"]
          next if nested_attributes_with_index.nil?
          nested_klass = object.class.reflect_on_association(_nested_key).class_name.constantize
          nested_klass.columns_hash.select { |_key, attr| attr.type.in? [:json, :jsonb] }.keys.each do |key|
            nested_attributes_with_index.each {|_index, nested_attributes|
              next unless nested_attributes.respond_to?(:key)
              next unless nested_attributes.key? key
              json_data = nested_attributes[key]
              data = if json_data == 'null' || json_data.blank?
                       {}
                     else
                       JSON.parse(json_data)
              end
              object.send(_nested_key).each {|nested_object|
                nested_object.attributes = { key => data }
              }
            }
          end
        }
      end
    end
  end
end
