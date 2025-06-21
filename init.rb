require_relative 'lib/redmine_wiki_custom_fields'

Redmine::Plugin.register :redmine_wiki_custom_fields do
  name 'Redmine Wiki Custom Fields'
  author 'OpenAI Codex'
  description 'Adds custom field support to wiki pages.'
  version '0.1.0'
  requires_redmine version_or_higher: '5.0'
end
