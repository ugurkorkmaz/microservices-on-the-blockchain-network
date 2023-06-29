.PHONY: all clean

DOCS_DIR := docs
PDFS_DIR := pdfs
EPUBS_DIR := epubs
LANGUAGES := en tr fr es

DOCS := $(wildcard $(DOCS_DIR)/*.md)
PDFS := $(patsubst $(DOCS_DIR)/%.md,$(PDFS_DIR)/%.pdf,$(DOCS))
EPUBS := $(patsubst $(DOCS_DIR)/%.md,$(EPUBS_DIR)/%.epub,$(DOCS))

all: $(PDFS) $(EPUBS)

$(PDFS_DIR)/%.pdf: $(DOCS_DIR)/%.md
	mkdir -p $(PDFS_DIR)
	pandoc $< -o $@

$(EPUBS_DIR)/%.epub: $(DOCS_DIR)/%.md
	mkdir -p $(EPUBS_DIR)
	pandoc $< -o $@

clean:
	rm -rf $(PDFS_DIR) $(EPUBS_DIR)
