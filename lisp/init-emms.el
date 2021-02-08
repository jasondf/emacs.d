(require 'emms-setup)
(require 'emms-player-vlc)

(emms-all)
;(emms-standard)

(emms-default-players)
(setq emms-player-vlc-command-name "/Applications/VLC.app/Contents/MacOS/VLC")

(setq emms-source-file-default-directory "~/Music/MyMusic/")

(setq emms-playlist-buffer-name "*Music*")

(provide 'init-emms)

 
