module Markuper
  class Base
    after_build do |element|
      data_bind = element.options.delete(:bind)                                           

      element.options.each_pair do |key, value|
        if key.to_s.match(/^bind_/)
          element.options.delete(key)
          binding = key.to_s.sub(/^bind_/, '')

          data_bind = {} unless data_bind.present?
          data_bind[binding] = value
        end
      end

      if data_bind.instance_of?(Hash)
        attr_bindings = data_bind[:attr] || {}
        event_bindings = data_bind[:event] || {}

        data_bind.each_pair do |key, value|
          if element._attribute_bindings.include? key.to_s
            data_bind.delete(key)
            attr_bindings[key] = value
          elsif element._event_bindings.include? key.to_s
            data_bind.delete(key)
            event_bindings[key] = value
          end
        end

        data_bind[:attr] = attr_bindings if attr_bindings.present?
        data_bind[:event] = event_bindings if event_bindings.present?
      end

      if data_bind.present?
        element.options['data-bind'] = element._ko_bind(data_bind, true)
      end
    end

    def _attribute_bindings
      [ 'id', 'href', 'src', 'name', 'action', 'placeholder' ]
    end

    def _event_bindings
      ['mouseover', 'mouseout']
    end

    def _ko_bind bind_value, root=false
      all_binds = []

      if bind_value.instance_of?(Hash)
        bind_value.each_pair do |key, value|
          all_binds.push "#{key}: #{self._ko_bind(value)}"
        end
      else
        return bind_value
      end

      return root ? all_binds.join(', ') : "{#{all_binds.join(', ')}}"
    end
  end
end
