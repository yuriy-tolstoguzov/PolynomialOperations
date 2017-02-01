//
//  PolynomialRow.c
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/22/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#include "PolynomialRow.h"
#include <stdlib.h>

// Init

void pln_row_init(pln_row_t *op_ptr, size_t size) {
    pln_row_t op = malloc(sizeof(r_pln_t) * size);
    for (int i = 0; i < size; i++) {
        r_pln_init(&op[i]);
    }

    *op_ptr = op;
}

void pln_row_set(pln_row_t dst, pln_row_t src, size_t size) {
    for (int i = 0; i < size; i++) {
        r_pln_set(&dst[i], src[i]);
    }
}

void pln_row_clear(pln_row_t op, size_t size) {
    for (int i = 0; i < size; i++) {
        r_pln_clear(op[i]);
    }
    free(op);
}

// Arithmetics

r_pln_t pln_row_lshift(pln_row_t row, size_t size) {
    r_pln_t first_pln = row[0];
    for (int i = 1; i < size; i++) {
        r_pln_swap(&row[i - 1], &row[i]);
    }

    r_pln_t zero;
    r_pln_init_set_ui(&zero, 0);
    row[size - 1] = zero;

    return first_pln;
}
