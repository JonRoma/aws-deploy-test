all:	*.zip

%.zip: %.py
	echo rm -f $@
	zip -r9 $@ $<

clean:
	rm *.zip
