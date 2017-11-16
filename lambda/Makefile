all:	foo.zip

foo.zip: foo.py
	rm -f $@
	zip -r9 foo.zip ./foo.py

clean:
	rm foo.zip
