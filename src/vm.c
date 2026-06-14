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
