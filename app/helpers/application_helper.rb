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

  def omniauth_button(provider, resource_name)
    provider_name = provider.downcase.to_s.split('_')[0]
    options = {
      class: "#{provider_name} ui button plus fluid"
    }

    link_to(omniauth_authorize_path(resource_name, provider), options) do
      "#{content_tag(:i, "", class: "#{provider_name} plus icon")}
        #{provider_name.capitalize}".html_safe
    end
  end
end
