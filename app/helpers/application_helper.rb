module ApplicationHelper
  def flash_message
    flash_path = 'layouts/flashes'
    if flash[:notice]
      render "#{flash_path}/notice"
    elsif flash[:danger]
      render "#{flash_path}/danger"
    elsif flash[:alert]
      render "#{flash_path}/alert"
    end
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
