# Custom version information for this Zammad instance
# This file tracks custom modifications and build information

module ZammadCustom
  VERSION = '1.0.0'
  BUILD_DATE = Time.current.strftime('%Y-%m-%d')
  CUSTOM_FEATURES = [
    'Custom Branding',
    'Enhanced Logging',
    'Custom API Endpoints'
  ].freeze
  
  def self.version_info
    "Zammad Custom v#{VERSION} (Build: #{BUILD_DATE})"
  end
  
  def self.feature_list
    CUSTOM_FEATURES.join(', ')
  end
end 