require "knockoutjs_markuper/version"

Markuper.builders do
  base.after_build do |element|
    data_bind = element.options.delete(:bind)                                           
    all_binds = []

    if data_bind.present?
      data_bind.each_pair do |key, value|
        all_binds.push "#{key}: #{value}"
      end

      element.options['data-bind'] = all_binds.join(', ')
    end
  end
end
