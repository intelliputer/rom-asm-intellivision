# Intellivision ROM Assembly Sources

This repository pairs a collection of Intellivision cartridge images with
SDK-1610 disassemblies of those images. It is intended as a convenient
reference for studying CP-1610 code, cartridge layouts, graphics data, and
the Intellivision EXEC interface.

## Repository layout

- `roms/` contains 178 `.int` ROM images. The collection includes commercial
  releases, prototypes, alternate revisions, demos, BIOS images, and
  homebrew software. See [roms/readme.md](roms/readme.md) for collection
  details.
- `src/` contains a corresponding `.asm` file for every ROM in `roms/`.
  Each source filename matches its ROM filename, except for the extension.

## Source generation

The assembly files were generated with SDK-1610's `dis1600` disassembler.
For the majority of the ROMs, normal control-flow and data analysis was used.
A small number of BIOS-style or nonstandard images caused that analysis to
fail, so they were generated with `dis1600 -a`, which disables advanced
analysis while still producing an address-annotated assembly listing.

The generated files are disassemblies, not original developer source. Labels,
code/data boundaries, and comments are inferred by the tool and should be
reviewed when using them for modification or preservation work.

## Rebuilding

The output uses SDK-1610 names for EXEC routines, STIC registers, and EXEC
RAM locations. Those names are supplied by the SDK symbol definitions and are
not emitted into every generated file. To assemble a listing independently,
provide the relevant SDK-1610 symbol definitions (or replace the symbolic
references with their numeric addresses).

## License and ROMs

See [LICENSE](LICENSE) for this repository's license. The presence of a ROM
image in this collection does not grant rights to distribute, modify, or use
the underlying game or firmware beyond the rights granted by its copyright
holder.
