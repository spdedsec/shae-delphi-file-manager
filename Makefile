# Makefile — shae-delphi-file-manager
#
# SHAE File Manager (Free Pascal / Delphi). Console application.
#
# NOTE: Free Pascal is not installed in this environment, so `make build` and
# `make test` cannot be run locally. See README.md and scripts/install.sh.

.PHONY: build test release clean install help

SRC      := src/filemanager.pas
TARGET   := filemanager
RELEASE  := shae-delphi-file-manager-v0.1.0.zip
FPC      ?= fpc

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

build: $(TARGET) ## Build the file manager binary

$(TARGET): $(SRC)
	$(FPC) $(SRC)
	@echo "Build OK: ./$(TARGET)"

test: build ## Compile (serves as the syntax/test check for Pascal)
	@echo "Test OK: $(SRC) compiles with fpc."

release: clean ## Create a release zip of src/
	@rm -f $(RELEASE)
	zip -r $(RELEASE) src scripts Makefile README.md DESIGN.md LICENSE docs
	@echo "Release artifact: $(RELEASE)"

clean: ## Remove build artifacts
	rm -f $(TARGET) *.o *.ppu *.bak
	rm -f $(RELEASE)

install: ## Notes on installing (see scripts/install.sh)
	@./scripts/install.sh
