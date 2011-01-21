OCAMLMAKEFILE = ../OCamlMakefile

INCDIRS = +camlp4

THREADS = yes

SOURCES = ort_seq.mli \
	ort_lazy_io.mli \
	ort_fileutils.mli \
	ort_function.mli \
	ort.mli \
	ort_seq.ml \
	ort_fileutils.ml \
	ort_lazy_io.ml \
	ort_function.ml \
	ort.ml

RESULT  = seq

PACKS = core_extended

LIBINSTALL_FILES = ort_seq.mli ort_seq.cmi \
	ort_fileutils.mli ort_fileutils.cmi \
	ort_lazy_io.mli ort_lazy_io.cmi \
	ort_function.mli ort_function.cmi \
	ort.mli ort.cmi \
	seq.cma seq.cmxa seq.a

all:	byte-code-library native-code-library

install:	libinstall
uninstall:	libuninstall

clean::  clean-doc

-include $(OCAMLMAKEFILE)
