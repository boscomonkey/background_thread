module ThreadStatusesHelper
  def row_css_class(recent_statuses, aStatus)
    css = recent_statuses.include?(aStatus) ? 'recent' : 'stale'
    css += '_master' if aStatus.is_master
    css
  end
end
