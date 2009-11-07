WillPaginate::ViewHelpers.pagination_options[:prev_label] = '{ Anterior'
WillPaginate::ViewHelpers.pagination_options[:next_label] = 'Próxima }'

class ActiveRecord::Base
  def self.per_page
    10
  end
end
