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
