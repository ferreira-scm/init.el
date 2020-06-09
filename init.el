;; -*- coding: latin-1; -*-                                                                                                                                                                                 
;; Susana Ferreira
(setq user-mail-address "susanaferreira@posteo.net")                                                                                                                                                        
(setq inhibit-startup-message t)

;; package manager el-get                                                                                                                                                                                   
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")                                                                                                                                                         
                                                                                                                                                                                                            
;; install el-get as package manager                                                                                                                                                                        
                                                                                                                                                                                                            
(unless (require 'el-get nil t)                                                                                                                                                                             
  (url-retrieve                                                                                                                                                                                             
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"                                                                                                                                         
   (lambda (s)                                                                                                                                                                                              
     (end-of-buffer)                                                                                                                                                                                        
     (eval-print-last-sexp))))
     
;;;;;;;;;;;;;;;;;;;;;;;;;;;; additonal packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                               
(require 'package)                                                                                                                                                                                          
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))                                                                                                                                   
                                                                                                                                                                                                            
(defadvice package-compute-transaction                                                                                                                                                                      
    (before package-compute-transaction-reverse (package-list requirements) activate compile)                                                                                                               
  "reverse the requirements"                                                                                                                                                                                
  (setq requirements (reverse requirements))                                                                                                                                                                
      (print requirements))                                                                                                                                                                                 
                                                                                                                                                                                                            
                                                                                                                                                                                                            
(require 'package)                                                                                                                                                                                          
(add-to-list 'package-archives                                                                                                                                                                              
             '("melpa" . "http://melpa.milkbox.net/packages/") t)                                                                                                                                           
(package-initialize)

;; lets play with color                                                                                                                                                                                     
(require 'color-theme)                                                                                                                                                                                      
(color-theme-initialize)                                                                                                                                                                                    
;; (color-theme-tty-dark)                                                                                                                                                                                   
;; (color-theme-jsc-dark)                                                                                                                                                                                   
(color-theme-charcoal-black)                                                                                                                                                                                
                                                                                                                                                                                                            
(custom-set-faces                                                                                                                                                                                           
 ;; custom-set-faces was added by custom, one such instance!                                                                                                                                                
 '(font-lock-comment-face ((t (:foreground "color-244"))))                                                                                                                                                  
 '(linum ((t (:inherit shadow :background "color-232" :foreground "color-191"))))                                                                                                                           
 '(mode-line-buffer-id ((t (:bold t :foreground "color-118" :background "color-58"))))                                                                                                                      
  '(mode-line ((t (:bold t :foreground "color-58" :background "color-107" )))))                                                                                                                             
                                                                                                                                                                                                            
;; line-numbers, very sophisticated function to make the numbering right-justified and the column the right size                                                                                            
(require 'linum)                                                                                                                                                                                            
(setq                                                                                                                                                                                                       
 linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string                                                 
                                                                                                                                           w) "d ")) line) 'face 'linum)))                                  
(global-set-key [f1] 'linum-mode)                                                                                                                                                                           
                                                                                                                                                                                                            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; window and buffer general;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                  
;; Easy between windows                                                                                                                                                                                     
(defun select-next-window ()                                                                                                                                                                                
  "Switch to the next window"                                                                                                                                                                               
  (interactive)                                                                                                                                                                                             
  (select-window (next-window)))                                                                                                                                                                            
                                                                                                                                                                                                            
(defun select-previous-window ()                                                                                                                                                                            
  "Switch to the previous window"                                                                                                                                                                           
  (interactive)                                                                                                                                                                                             
  (select-window (previous-window)))
  (global-set-key "\C-xo" 'select-next-window)                                                                                                                                                                
(global-set-key "\C-xO" 'select-previous-window)                                                                                                                                                            
                                                                                                                                                                                                            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ESS stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                           
(require 'ess-site)                                                                                                                                                                                         
                                                                                                                                                                                                            
;; ;; set the help right to open text                                                                                                                                                                       
(setq inferior-ess-r-help-command "help(\"%s\", help_type=\"text\")\n")                                                                                                                                     
                                                                                                                                                                                                            
;; ;; always scroll to output and input                                                                                                                                                                     
(setq comint-scroll-to-bottom-on-input t)                                                                                                                                                                   
(setq comint-scroll-to-bottom-on-output t)                                                                                                                                                                  
                                                                                                                                                                                                            
(setq ess-tab-complete-in-script t)                                                                                                                                                                         
                                                                                                                                                                                                            
;; Sweave .Rnw mode stuff.                                                                                                                                                                                  
(require 'ess-noweb)                                                                                                                                                                                        
(autoload 'R-mode "ess-site.el" "ESS" t)                                                                                                                                                                    
                                                                                                                                                                                                            
;;show matching parentheses                                                                                                                                                                                 
(show-paren-mode 1)                                                                                                                                                                                         
                                                                                                                                                                                                            
;; restore frames from previos session)                                                                                                                                                                     
(desktop-save-mode)      
  
