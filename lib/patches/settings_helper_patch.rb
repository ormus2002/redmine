module Patches
  module SettingsHelperPatch
    
    def self.included(base)
      # наследуем родные методы
#      base.extend(ClassMethods)
      # расширяем класс своими методами
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        
        alias_method :notification_field, :notification_field_ext
        
      end
    end
    
    module InstanceMethods
      # Renders a notification field for a Redmine::Notifiable option
      def notification_field_ext(notifiable)
        return content_tag(:label,
                           check_box_tag('settings[notified_events][]',
                                         notifiable.name,
                                         Setting.notified_events.include?(notifiable.name), :id => nil).html_safe + 
                          l_or_humanize(notifiable.name, :prefix => 'label_').html_safe, 
                           :class => notifiable.parent.present? ? "parent" : '').html_safe + 
                text_field_tag("settings[plugin_redmine_email_footers][#{notifiable.name}]", Setting.plugin_redmine_email_footers[notifiable.name], :size => 50).html_safe
      end
    end
    
  end
end


