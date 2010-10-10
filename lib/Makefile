OCAMLMAKEFILE = ../OCamlMakefile

INCDIRS = +camlp4

SOURCES = seq.mli lazy_io.mli seq.ml lazy_io.ml

RESULT  = seq

LIBINSTALL_FILES = seq.mli lazy_io.mli seq.cmi lazy_io.cmi seq.cma seq.cmxa seq.a

all:	byte-code-library native-code-library

install:	libinstall
uninstall:	libuninstall

clean::  clean-doc

-include $(OCAMLMAKEFILE)
