Redmine::Plugin.register :redmine_email_footers do
  name 'Redmine Email Footers plugin'
  author 'Ormus'
  description 'This plugin add footers for each type of notified email in settings'
  version '0.0.1'
#  url 'http://example.com/path/to/plugin'
#  author_url 'http://example.com/about'
  settings :default => { 'issue_added' => '', 'issue_updated' => '', 'issue_note_added' => '', 'issue_status_updated' => '', 'issue_priority_updated' => '', 'news_added' => '', 'news_comment_added' => '', 'document_added' => '', 'file_added' => '', 'message_posted' => '', 'wiki_content_added' => '', 'wiki_content_updated' => '' }
end

ActionDispatch::Callbacks.to_prepare do
  SettingsHelper.send(:include, Patches::SettingsHelperPatch)
end
