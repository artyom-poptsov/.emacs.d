;;; arduino.el -- Arduino mode configuration.

(defconst %arduino-dir "/opt/arduino/")


(if (file-exists-p %arduino-dir)
    (progn
      (crane:load-extension "arduino-mode/arduino-mode")
      (require 'arduino-mode)

      (setq ede-arduino-appdir %arduino-dir)

      (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode)
				  auto-mode-alist))
      (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t))
  (lwarn :warning "Arduino IDE not found in %s."
         %arduino-dir))

;;; arduino.el ends here.
