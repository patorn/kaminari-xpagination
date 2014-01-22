require "kaminari/xpagination/version"

module Kaminari
  module Xpagination
    protected

    def set_x_pagination_headers(scope)
      data = {}
      scope = instance_variable_get(:"@#{scope}")
      url   = request.original_url.sub(/\?.*$/, '')
      pages = {}

      data[:total] = scope.total_count
      data[:total_pages] = scope.total_pages

      unless scope.first_page?
        pages[:first] = 1
        pages[:prev]  = scope.current_page - 1
      end

      unless scope.last_page?
        pages[:last] = scope.total_pages
        pages[:next] = scope.current_page + 1
      end

      pages.each do |k, v|
        new_params = request.query_parameters.merge({ page: v })
        data.merge!({ "#{k}" => "#{url}?#{new_params.to_param}" })
      end

      headers['X-Pagination'] = data.to_json
    end
  end
end

begin; require 'rails'; rescue LoadError; end
if defined?(ActionController::Base)
  ActionController::Base.send(:include, Kaminari::Xpagination)
end

begin; require 'rails-api'; rescue LoadError; end
if defined?(ActionController::API)
  ActionController::API.send(:include, Kaminari::Xpagination)
end