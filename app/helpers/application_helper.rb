module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    options = { no_intra_emphasis: true, 
                fenced_code_blocks: true,
                autolink: true,
                strikethrough: true,
                superscript: true,
                lax_spacing: true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text).html_safe
  end
end
