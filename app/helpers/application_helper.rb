module ApplicationHelper

  def main_nav_link(text, path, options = {})
    active = current_page?(path) ? 'active' : ''
    default_options = {
      class: "item #{active}"
    }.merge(options)

    link_to(text, path, default_options)
  end

  def default_meta_tags(options = {})
    { site: t('meta.default.site'),
      description: t('meta.default.description'),
      viewport: "width=device-width, initial-scale=1, maximum-scale=1",
      reverse: true,
      charset: "utf-8" }
  end
end
