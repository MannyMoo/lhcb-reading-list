
ALL_MD = $(wildcard *.md)
EXCLUDE_MD = README.md
SRC_MD = $(filter-out $(EXCLUDE_MD),$(ALL_MD))
ALL_HTML = $(patsubst %.md,%.html,$(SRC_MD))

%.html : %.md Makefile
	@pandoc \
	-s \
	-t html \
	-o $@ $<

all : $(ALL_HTML)
