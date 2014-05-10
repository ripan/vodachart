FLASH_ALERT_MAPPING = {
  :notice => :success,
  :alert => :danger
}

#PROJECT_ATTRIBUTES = {:task => 'primary',:milestone => 'info', :issue => 'success', :risk => 'danger'}
VIEW_OPTIONS = %w(milestones risks issues)


class String
  def to_custom_time
    Time.parse(self).to_s(:db)
  end
end
