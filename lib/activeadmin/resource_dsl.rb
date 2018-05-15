require 'activeadmin'

module ActiveAdmin
  class ResourceDSL
    def json_editor
      before_save do |object, _args|
        namespace = object.class.name.underscore.tr('/', '_')
        raise ActionController::ParameterMissing, namespace unless params.key?(namespace)
        keys = object.class.columns_hash.select { |_key, attr| attr.type.in? %i[json jsonb] }.keys
        keys.each do |key|
          next unless params[namespace].key? key
          json_data = params[namespace][key]
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
