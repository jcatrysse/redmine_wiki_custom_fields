module RedmineWikiCustomFields
  module WikiPagePatch
    def self.included(base)
      base.class_eval do
        acts_as_customizable
        safe_attributes 'custom_field_values'
      end
    end
  end
end

Rails.configuration.to_prepare do
  unless WikiPage.included_modules.include?(RedmineWikiCustomFields::WikiPagePatch)
    WikiPage.include RedmineWikiCustomFields::WikiPagePatch
  end
end
