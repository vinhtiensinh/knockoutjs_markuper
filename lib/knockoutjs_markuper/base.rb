Markuper.builders do
  base.after_build do |element|
    data_bind = element.options.delete(:bind)                                           
    if data_bind.present?
      element.options['data-bind'] = element._ko_bind(data_bind, true)
    end
  end

  base.send(:define_method, :_ko_bind) do |bind_value, root=false|
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
