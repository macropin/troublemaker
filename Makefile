# To render on Mac run the following before make
# export SCAD_BIN="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

SCAD_BIN?=scad

STL_OUTPUT=$(patsubst %.scad,%.stl,$(wildcard */*.scad))

.PHONY: all openscad

all: openscad

openscad: $(STL_OUTPUT)
%.stl: %.scad
	$(SCAD_BIN) -o $@ $<

