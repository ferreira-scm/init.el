;; -*- coding: latin-1; -*-                                                                                                                                                                               
;; Susana Ferreira                                                                                                                                                                                        
;; local machine

(setq user-mail-address "susanaferreira@posteo.net")                                                                                                                                                      
(setq inhibit-startup-message t)                                                                                                                                                                          
                                                                                                                                                                                                          
;; line-numbers                                                                                                                                                                                           
;(require 'linum)                                                                                                                                                                                         
;(global-linum-mode t)                                                                                                                                                                                    
                                                                                                                                                                                                          
                                                                                                                                                                                                          
;;;;;;;;;;;;;;;;;;;;;;;;;;;; additonal packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                             
(require 'package)                                                                                                                                                                                        
(add-to-list 'package-archives                                                                                                                                                                            
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)                                                                                                                                  
(package-initialize)                                                                                                                                                                                      
                                                                                                                                                                                                          
                                                                                                                                                                                                          
;; color                                                                                                                                                                                                  
(load-theme 'manoj-dark)                                                                                                                                                                                  
                                                                                                                                                                                                          
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

;; restore frames from previos session)                                                                                                                                                                   
(desktop-save-mode) 
