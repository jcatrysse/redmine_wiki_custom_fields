module RedmineWikiCustomFields
  class Engine < Rails::Engine
    engine_name :redmine_wiki_custom_fields

    initializer 'redmine_wiki_custom_fields.patch' do
      require_relative 'redmine_wiki_custom_fields/wiki_page_patch'
      require_relative 'redmine_wiki_custom_fields/api/wiki_pages_api_patch'
    end
  end
end
