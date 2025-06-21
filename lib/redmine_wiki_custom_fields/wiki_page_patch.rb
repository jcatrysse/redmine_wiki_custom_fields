module RedmineWikiCustomFields
  module WikiPagePatch
    def self.prepended(base)
      base.class_eval do
        acts_as_customizable
        safe_attributes :custom_field_values
      end
    end
  end
end

Rails.configuration.to_prepare do
  WikiPage.prepend RedmineWikiCustomFields::WikiPagePatch unless WikiPage < RedmineWikiCustomFields::WikiPagePatch
end
