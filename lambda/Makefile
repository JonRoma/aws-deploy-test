OBJS	:= $(patsubst %.py, %.zip, $(wildcard *.py))

all:	${OBJS}

%.zip: %.py
	@rm -f $@
	zip -r9 $@ $<

clean:
	rm -f *.zip
