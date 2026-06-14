# Oyster Programming Language

![Version](https://img.shields.io/badge/version-0.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Oyster is a dynamic, Perl-inspired scripting language with a focus on simplicity and performance.

## Features

- Dynamic typing with 16-byte tagged values
- Perl-inspired syntax with modern enhancements
- Fast VM with dispatch table (ASCII → handler)
- Module system with .osm (source) and .oem (compiled)
- Rich standard library (regex, io, net, math, os, json)
- Built-in debugger with breakpoints and stepping
- UTF-32 strings with O(1) indexed access

## Installation

`git clone https://github.com/denrav2019/Oyster-v0.1.0.git`  
`cd Oyster-v0.1.0`  
`make`  
`sudo make install`

## Quick Start

Create a file `hello.osf`:

`print("Hello, Oyster!")`

Then run:

`oyster compile hello.osf`  
`oyster run hello.oce`

## Example

`use "io" as io`  
`use "math" as m`  
`@content = io.slurp("data.txt")`  
`print("File size: " . len(@content))`  
`$result = m.sin(m.%PI / 2)`  
`print("sin(PI/2) = " . $result)`

## Building from Source

`make`  
`make test`  
`make install`  
`make clean`

## Dependencies

**Ubuntu/Debian:**  
`sudo apt install build-essential libpcre2-dev`

**Fedora/RHEL:**  
`sudo dnf install gcc make pcre2-devel`

**macOS:**  
`brew install pcre2`

## Author

**Daniil Kranchev**  
GitHub: [@denrav2019](https://github.com/denrav2019)  
Email: nnikus2017@gmail.com

## License

MIT License - see the LICENSE file for details.

## Acknowledgments

- Perl - for inspiration  
- Lua - for VM design concepts  
- The open source community
