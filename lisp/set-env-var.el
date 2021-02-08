
;设置JAVA_HOME变量(二选一)
;(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home")
;(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home")

;(setenv "CLASSPATH" 
;	(concat 
;		"."":"
;		(getenv "JAVA_HOME")"/lib/dt.jar"":"
;		(getenv "JAVA_HOME")"/lib/tools.jar"
;	)
;   )

;(setenv "MAVEN_HOME" "/usr/local/Cellar/maven/3.3.9")

;The value of environment variable “PATH” is used by emacs 
;when you are running a shell in emacs, similar to when 
;you are using a shell in a terminal.

;The exec-path is used by emacs itself to find programs 
;it needs for its features, such as spell checking, 
;file compression, compiling, grep, diff, etc.

;设置PATH
;(setenv "PATH"
;        (concat "."":"
;		"/usr/local/bin" ":"
;		"/usr/local/sbin" ":"
;		"/usr/local/mysql/bin" ":"
;        "/usr/local/mysql/support-files" ":"
;        "/Users/jason/Applications/play-1.3.1" ":"
;        "/Users/jason/Applications/activator-1.3.10/bin" ":"
;        "/usr/local/Cellar/scala/2.11.8/bin" ":"
;		(getenv "PATH")":"
;        (getenv "MAVEN_HOME")"/bin" ":"
; 		(getenv "JAVA_HOME")"/bin"
;	)
;)

;设置exec-path
;(setq exec-path (append mypaths (list "." exec-directory)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;使用专用模块完成系统环境变量的导入
(require 'exec-path-from-shell)

;自定义需要导入的环境变量(默认的是"PATH"和"MANPATH")
(setq exec-path-from-shell-variables '("PATH" "MANPATH" "JAVA_HOME" "CLASSPATH" "MAVEN_HOME" "PYTHONPATH" "SCALA_HOME"))

;如果是Mac OS系统则执行初始化导入
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'set-env-var)
