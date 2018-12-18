require "dry/validation"
require "types"

module Blog
  module Admin
    module Articles
      FormSchema = Dry::Validation.Form do
        required(:title).filled
        required(:status).filled(included_in?: Types::ArticleStatus.values)
        required(:published_at).maybe(:time?)

        # rule(time_of_publication: %i[status published_at]) do |status, published_at|
        #   published_at.filled? > status.eql?('published')
        # end
      end
    end
  end
end
