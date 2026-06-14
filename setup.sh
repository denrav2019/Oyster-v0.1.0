#!/bin/bash
# setup.sh - Create full project structure for Oyster Language
# Copyright (c) 2026 Daniil Kranchev
# License: MIT

set -e

echo "=========================================="
echo "Oyster Language - Project Structure Setup"
echo "=========================================="
echo ""

# Create directories
echo "Creating directories..."
mkdir -p src
mkdir -p stdlib
mkdir -p docs
mkdir -p tests
mkdir -p examples/basic
mkdir -p examples/web_server
mkdir -p examples/file_processor
mkdir -p examples/math_demo
mkdir -p examples/json_api

echo "✓ Directories created"

# Create placeholder source files
echo "Creating source files..."

cat > src/main.c << 'EOF'
// Oyster Language - Main Entry Point
// Copyright (c) 2026 Daniil Kranchev
// SPDX-License-Identifier: MIT

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv) {
    printf("Oyster Language v0.1.0\n");
    printf("Copyright (c) 2026 Daniil Kranchev\n");
    printf("License: MIT\n");
    printf("\n");

    if (argc < 2) {
        printf("Usage: oyster <command> [args]\n");
        printf("Commands:\n");
        printf("  compile <file.osf>  - Compile Oyster source\n");
        printf("  run <file.oce>      - Run compiled program\n");
        printf("  build <file.osm>    - Build module\n");
        return 0;
    }

    return 0;
}
EOF

cat > src/vm.h << 'EOF'
// Oyster Language - Virtual Machine Header
// Copyright (c) 2026 Daniil Kranchev
// SPDX-License-Identifier: MIT

#ifndef OYSTER_VM_H
#define OYSTER_VM_H

#include <stdint.h>

typedef enum {
    V_INTEGER = 0,
    V_DECIMAL = 1,
    V_STRING = 2,
    V_ARRAY = 3,
    V_HASH = 4
} ValueType;

typedef struct {
    uint64_t data;
    uint64_t tag;
} Value;

typedef struct VM VM;

VM* vm_new(void);
void vm_free(VM* vm);
int vm_run(VM* vm);

#endif
EOF

cat > src/vm.c << 'EOF'
// Oyster Language - Virtual Machine Implementation
// Copyright (c) 2026 Daniil Kranchev
// SPDX-License-Identifier: MIT

#include <stdio.h>
#include <stdlib.h>
#include "vm.h"

struct VM {
    int exit_code;
    int had_error;
};

VM* vm_new(void) {
    VM* vm = calloc(1, sizeof(VM));
    return vm;
}

void vm_free(VM* vm) {
    free(vm);
}

int vm_run(VM* vm) {
    printf("VM running...\n");
    return 0;
}
EOF

echo "✓ Source files created"

# Create standard library modules
echo "Creating standard library..."

cat > stdlib/io.osm << 'EOF'
# IO Module for Oyster
# Copyright (c) 2026 Daniil Kranchev

fun print(@msg) {
    return builtin_print(@msg)
}

fun slurp(@path) {
    return builtin_slurp(@path)
}

fun spew(@path, @content) {
    return builtin_spew(@path, @content)
}

export print, slurp, spew
EOF

cat > stdlib/math.osm << 'EOF'
# Math Module for Oyster
# Copyright (c) 2026 Daniil Kranchev

const %PI = 3.141592653589793
const %E = 2.718281828459045

fun sin(%x) {
    return builtin_sin(%x)
}

fun cos(%x) {
    return builtin_cos(%x)
}

fun sqrt(%x) {
    return builtin_sqrt(%x)
}

export %PI, %E, sin, cos, sqrt
EOF

cat > stdlib/regex.osm << 'EOF'
# Regex Module for Oyster
# Copyright (c) 2026 Daniil Kranchev

fun match(@str, @pattern) {
    return builtin_regex_match(@str, @pattern)
}

fun replace(@str, @pattern, @replacement) {
    return builtin_regex_replace(@str, @pattern, @replacement)
}

export match, replace
EOF

echo "✓ Standard library created"

# Create tests
echo "Creating tests..."

cat > tests/test_basic.osf << 'EOF'
# Basic test
print("Basic test passed!")
EOF

cat > tests/test_math.osf << 'EOF'
# Math test
use "math" as m

$result = m.sin(m.%PI / 2)
print("sin(PI/2) = " . $result)
EOF

echo "✓ Tests created"

# Create examples
echo "Creating examples..."

cat > examples/basic/main.osf << 'EOF'
# Basic example
print("Hello from Oyster!")

$sum = 0
for $i in 1..10 {
    $sum = $sum + $i
}
print("Sum 1..10 = " . $sum)
EOF

cat > examples/web_server/main.osf << 'EOF'
# Web server example
use "net" as net

print("Starting web server on port 8080...")
$server = net.tcp_listen(8080)

while true {
    $client = net.accept($server)
    net.send($client, "HTTP/1.0 200 OK\n\nHello from Oyster!")
    net.close($client)
}
EOF

cat > examples/file_processor/main.osf << 'EOF'
# File processor example
use "io" as io

@content = io.slurp("input.txt")
@lines = split(@content, "\n")
$count = len(@lines)
print("Lines: " . $count)
EOF

cat > examples/math_demo/main.osf << 'EOF'
# Math demo
use "math" as m

for $i in 0..10 {
    %rad = $i * m.%PI / 10
    print("sin(" . %rad . ") = " . m.sin(%rad))
}
EOF

cat > examples/json_api/main.osf << 'EOF'
# JSON API example
use "net" as net
use "json" as json

&resp = net.http_get("https://jsonplaceholder.typicode.com/posts/1")
$body = hash_get(&resp, "body")
&data = json.parse($body)
print("Title: " . hash_get(&data, "title"))
EOF

echo "✓ Examples created"

# Create documentation
echo "Creating documentation..."

cat > docs/README.md << 'EOF'
# Oyster Documentation

## Language Reference

### Variables
- `$integer` - Integer (64-bit)
- `%decimal` - Decimal (double)
- `@array` - Array
- `@string` - String
- `&hash` - Hash (via stdlib)

### Control Flow
- `if/else`
- `while`
- `for in`

### Functions
fun name($param) {
    return $param
}

## Standard Library
- `io` - Input/Output operations
- `net` - Networking
- `regex` - Regular expressions
- `math` - Mathematical functions

## Examples
See `/examples` directory.
EOF

echo "✓ Documentation created"

# Create .gitignore
echo "Creating .gitignore..."

cat > .gitignore << 'EOF'
# Build artifacts
/bin/
/obj/
*.o
*.a
*.so
*.oem
*.oce

# IDE files
.vscode/
.idea/
*.swp

# OS files
.DS_Store
Thumbs.db

# Test artifacts
*.log

# Distribution
*.tar.gz
oyster-*/
EOF

echo "✓ .gitignore created"

# Create AUTHORS.txt if not exists
if [ ! -f AUTHORS.txt ]; then
    cat > AUTHORS.txt << 'EOF'
Daniil Kranchev <nnikus2017@gmail.com>
EOF
    echo "✓ AUTHORS.txt created"
fi

echo ""
echo "=========================================="
echo "Setup complete!"
echo "=========================================="
echo ""
echo "Directory structure created:"
echo "  src/       - Source code (C files)"
echo "  stdlib/    - Standard library (.osm)"
echo "  docs/      - Documentation"
echo "  tests/     - Test files"
echo "  examples/  - Example programs"
echo ""
echo "Next steps:"
echo "  1. make          - Build the project"
echo "  2. make test     - Run tests"
echo "  3. make install  - Install to /usr/local"
echo ""
echo "Push to GitHub:"
echo "  git add ."
echo "  git commit -m 'Initial commit: Oyster v0.1.0'"
echo "  git push origin main"
