module ApplicationHelper

  ##
  # Creates a styled link for use in a navbar
  # Adds a class of active if the current path is equal to the links path
  # - text - Text to display
  # - path - Path of the link
  # - options - hash of html declarations, eg id
  def main_nav_link(text, path, options = {})
    active = current_page?(path) ? 'active' : ''
    default_options = {
      class: "item #{active}",
    }.merge(options)

    link_to(text, path, default_options)
  end

  ##
  # Creates a hash of default meta tags.
  # Used as an argument for display_meta_tags
  def default_meta_tags(options = {})
    { site: t('meta.default.site'),
      description: t('meta.default.description'),
      viewport: "width=device-width, initial-scale=1, maximum-scale=1",
      reverse: true,
      charset: "utf-8" }
  end

  ##
  # Creates a styled omniauth button.
  # - resource_name - Devise resource eg User
  # - provider - Omniauth provider :symbol
  # - example:
  #   - resource_class.omniauth_providers.each do |provider|
  #     = omniauth_button(provider, resource_name)
  def omniauth_button(provider, resource_name)
    provider_name = provider.downcase.to_s.split('_')[0]
    options = {
      class: "#{provider_name} ui button plus fluid",
      id: "#{provider_name}Button",
    }

    link_to(omniauth_authorize_path(resource_name, provider), options) do
      "#{content_tag(:i, "", class: "#{provider_name} plus icon")}
        #{provider_name.capitalize}".html_safe
    end
  end
end
