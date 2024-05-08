module NavigationHelper
  def header_link_class(site_section_path)
    return "active" if request.path.split("/").second == site_section_path
  end
end
