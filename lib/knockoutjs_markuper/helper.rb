require 'markuper'
require 'active_support/concern'

module Markuper
  module KnockoutjsHelper
    extend Markuper::Helper
    extend ActiveSupport::Concern
    included do
      Markuper::Helper.markuper_helper(:ko => Ko)
    end
  end
end
