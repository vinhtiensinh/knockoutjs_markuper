require 'markuper/helper'
module Markuper
  class Railtie < Rails::Railtie
    initializer 'knockoutjs_markuper.helper' do
      ActionView::Base.send :include, Markuper::KnockoutjsHelper
    end

    initializer "knockoutjs_markuper.template dir" do
      ActionController::Base.append_view_path "#{::File.expand_path(::File.dirname(__FILE__))}/../../views"
    end
  end
end
