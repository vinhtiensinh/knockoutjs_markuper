module Markuper
  class Ko < Base
    attr_accessor :action
    default_template 'ko'

    builder :if do |element|
      element.action = 'if'
    end

    builder :with do |element|
      element.action = 'with'
    end

    builder :foreach do |element|
      element.action = 'foreach'
    end
  end
end
