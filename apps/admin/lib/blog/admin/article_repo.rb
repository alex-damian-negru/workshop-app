require "blog/repository"
require_relative 'entities'

module Blog
  module Admin
    class ArticleRepo < Blog::Repository[:articles]
      struct_namespace Entities
      commands :create, update: :by_pk

      def by_id(id)
        articles.by_pk(id).one!
      end

      def listing
        articles.order { created_at.desc }
      end

      private

      def articles
        super.combine(:author)
      end
    end
  end
end
