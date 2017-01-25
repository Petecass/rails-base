# frozen_string_literal: true
module DeviseHelper
  def devise_error_messages!
    return '' unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    html(messages, sentence)
  end

  def html(messages, sentence)
    html = <<-HTML
      <div class='ui negative message' id='error_explanation'>
        <i class='close icon'></i>
        <div class='header'>#{sentence}</div>
        <ul class='list'>#{messages}</ul>
      </div>
    HTML

    safe_join([html.html_safe])
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
