module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def last_updated(collection)
    time = collection.count > 0 ? t('saved_at') + collection.map(&:updated_at).max.in_time_zone('Minsk').strftime('%Y-%m-%d %H:%M:%S') : ''
    content_tag(:span, time, class: 'badge')
  end

  def order_by(field)
    link_to '', "?order_by=#{field}&direction=#{params[:direction] == 'desc' ? 'asc' : 'desc'}", class: 'glyphicon glyphicon-sort'
  end
end
