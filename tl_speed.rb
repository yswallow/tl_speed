# -*- coding: utf-8 -*-

Plugin.create(:tl_speed) do
  tweets = []
  on_update do |service, messages|
    time = Time.now
    tweets.delete_if{ |message| message.created < time - 120 }
    tweets += messages
    
    Plugin.call(:gui_window_rewindstatus, Plugin::GUI::Window.instance(:default), "分速#{ '%.1f' % (tweets.size.to_f / 2) }ツイート", Time.now+60 )
  end
end

