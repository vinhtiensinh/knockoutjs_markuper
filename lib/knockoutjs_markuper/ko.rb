module Markuper
  class Ko < Base
    attr_accessor :action
    default_template 'ko'

    before_build do |element|
      element.data = element.data.html_safe
    end

    builder :if do |element|
      element.action = 'if'
    end

    builder :ifnot do |element|
      element.action = 'ifnot'
    end

    builder :with do |element|
      element.action = 'with'
    end

    builder :foreach do |element|
      element.action = 'foreach'
    end
  end
end
