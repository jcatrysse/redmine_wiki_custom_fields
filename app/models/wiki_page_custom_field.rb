class WikiPageCustomField < CustomField
  def type_name
    :label_wiki_page
  end

  def visible_by_project?
    true
  end
end
