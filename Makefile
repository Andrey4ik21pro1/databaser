APP_NAME := databaser
SRC_DIR := src

.PHONY: build run deploy

build:
	@echo [BUILD] Build start...
	@pyinstaller --name $(APP_NAME) --windowed --paths=$(SRC_DIR) --icon=$(SRC_DIR)/logo.ico  --add-data "$(SRC_DIR)/logo.ico;." $(SRC_DIR)/main.py
	@move dist\$(APP_NAME)\_internal\logo.ico dist\$(APP_NAME) > NUL 2>&1
	@rmdir /s /q build

run:
	@echo [RUN] Execute $(APP_NAME)
	@cd dist\$(APP_NAME) && .\$(APP_NAME).exe

deploy:
	@echo [DEPLOY] Compiling setup.exe...
	"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" ".\inno.iss"
