(defun config-yasnippet ()
  "Personalizacion de yasnippet en emacs."
  (require 'yasnippet)
  (yas/initialize))

(defun config-fci ()
  "Personalizacion de fill collum indicator en emacs."
  (require 'fill-column-indicator)
  (setq whitespace-style '(face trailing))
  (setq-default fci-rule-column 80)
  (setq fci-rule-width 3)
  (add-hook 'emacs-lisp-mode-hook 'fci-mode))

(defun config-autopair ()
  "Personalizacion de autopair en emacs."
  (require 'autopair)
  (autopair-global-mode))

(defun config-powerline ()
  "Personalizacion de emacs powerline"
  (require 'powerline)
  (setq powerline-arrow-shape 'arrow)
  (custom-set-faces
   '(mode-line ((t 
		 (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-inactive ((t 
			  (:foreground "#f9f9f9" :background "#666666" 
			   :box nil))))))


(defun config-hardcore ()
  "Personalizacion de emacs hardcore.
Habilita la tecla backspace."
  (setq too-hardcore-backspace t)
  (load-file
   (concat 
    (cadr (split-string (pwd))) "cfg-emacs/hardcore-mode.el/hardcore-mode.el"))
  (require 'hardcore-mode)
  (global-hardcore-mode))

(setq config-function-list (list #'config-autopair
				  #'config-fci
				  #'config-yasnippet
				  #'config-powerline
				  #'config-hardcore))

(let ((defaul-load-directory (pwd)))
      (normal-top-level-add-subdirs-to-load-path)
      (mapcar #'funcall config-function-list)
      )

;; deshabilita la barra de herramientas
(tool-bar-mode -1)

;; Indicador de la columna en la linea de modo (mode-bar)
(column-number-mode)

;; Deshabilita la pantalla de bienvenida o splash screen de emacs
(setq inhibit-splash-screen t)

(global-set-key (kbd "C-c y") '(lambda () 
				 (interactive)
				 (popup-menu 'yank-menu)))

(dolist (hooks 
	 (list 'c-mode-hook
	       'python-mode-hook
	       'emacs-lisp-mode-hook))
  (add-hook hooks 'linum-mode))
