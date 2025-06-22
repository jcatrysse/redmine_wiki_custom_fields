module RedmineWikiCustomFields
  class Engine < Rails::Engine
    engine_name :redmine_wiki_custom_fields

    initializer 'redmine_wiki_custom_fields.patch' do
      require_relative 'redmine_wiki_custom_fields/wiki_page_patch'
      require_relative 'redmine_wiki_custom_fields/api/wiki_pages_api_patch'
    end
  end
end

Rails.configuration.to_prepare do
  CustomFieldsHelper.module_eval do
    CUSTOM_FIELDS_TABS.push(
      { name: 'WikiPageCustomField', partial: 'custom_fields/index', label: :label_wiki_page_plural }
    ) unless CUSTOM_FIELDS_TABS.any? { |t| t[:name] == 'WikiPageCustomField' }
  end
end
