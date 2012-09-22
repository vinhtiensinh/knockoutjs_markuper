module Markuper
  class Ko < Base
    class << self
      attr_accessor :last
    end

    def last
      self.class.last
    end

    attr_accessor :action, :condition, :conditions
    default_template 'ko'

    builder :if do |element|
      element.action = 'if'
      element.condition  = element.data
      element.conditions = [element.condition]
    end

    builder :ifnot do |element|
      element.action = 'if'
      element.condition = "!(#{element.data})"
      element.conditions = [element.condition]
    end

    builder :elsif do |element|

      if element.last.action != 'if'
        raise Exception.new('missing prior if statement')
      end

      element.action = 'if'
      element.conditions = element.last.conditions
      element.condition = "!(#{element.last.conditions.join(' || ')}) && #{element.data}"
      element.conditions.push(element.data)
    end

    builder :else do |element|
      if element.last.action != 'if'
        raise Exception.new('missing prior if statement')
      end

      element.action = 'if'
      element.condition = "!(#{element.last.conditions.join(' || ')})"
    end

    builder :with do |element|
      element.action = 'with'
    end

    builder :foreach do |element|
      element.action = 'foreach'
    end

    after_build do |element|
      element.data = element.data.html_safe if element.data
      element.condition = element.condition.html_safe if element.condition
    end

    def to_s
      string = super
      self.class.last = self
      return string
    end
  end
end
