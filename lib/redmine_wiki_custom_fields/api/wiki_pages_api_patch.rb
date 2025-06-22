module RedmineWikiCustomFields
  module Api
    module WikiPagesApiPatch
      def render_wiki_page_json(page, api)
        super
        api.array :custom_fields do
          page.custom_field_values.each do |value|
            api.custom_field id: value.custom_field_id, name: value.custom_field.name do
              api.text! value.value.to_s
            end
          end
        end
      end
    end
  end
end

Rails.configuration.to_prepare do
  if defined?(::API) && API::V3.const_defined?(:WikiPages)
    API::V3::WikiPages::WikiPageRepresenter.prepend RedmineWikiCustomFields::Api::WikiPagesApiPatch
  end
end
