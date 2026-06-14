# Oyster Programming Language

![Version](https://img.shields.io/badge/version-0.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Oyster is a dynamic, Perl-inspired scripting language with a focus on simplicity and performance.

## Features

- **Dynamic typing** with 16-byte tagged values
- **Perl-inspired syntax** with modern enhancements
- **Fast VM** with dispatch table (ASCII → handler)
- **Module system** with `.osm` (source) and `.oem` (compiled)
- **Rich standard library** (regex, io, net, math, os, json)
- **Built-in debugger** with breakpoints and stepping
- **UTF-32 strings** with O(1) indexed access

## Installation

```bash
git clone https://github.com/daniil-kranchev/oyster
cd oyster
make
sudo make install
