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
