require_relative 'lib/redmine_wiki_custom_fields'

Redmine::Plugin.register :redmine_wiki_custom_fields do
  name 'Redmine Wiki Custom Fields'
  author 'Jan Catrysse'
  description 'Adds custom field support to wiki pages.'
  version '0.0.1'
  requires_redmine version_or_higher: '5.0'
end

Rails.configuration.to_prepare do
  tab = { name: 'WikiPageCustomField', partial: 'custom_fields/index', label: :label_wiki_page_plural }
  CustomFieldsHelper::CUSTOM_FIELDS_TABS.push(tab) unless CustomFieldsHelper::CUSTOM_FIELDS_TABS.any?{|t| t[:name] == tab[:name]}
end
