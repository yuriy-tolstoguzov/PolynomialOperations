//
//  PolynomialMatrix.c
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/21/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#include "PolynomialMatrix.h"
#include <stdlib.h>

// Init

size_t pln_mat_size(pln_t pln) {
    return pln_sizeinbase(pln, 2) - 1;
}

void pln_mat_init(pln_mat_t *op_ptr, size_t size) {
    r_pln_t **op = malloc(sizeof(r_pln_t*) * size);
    for (int i = 0; i < size; i++) {
        pln_row_init(&op[i], size);
    }

    *op_ptr = op;
}

void pln_mat_set(pln_mat_t dst, pln_mat_t src, size_t size) {
    for (int row = 0; row < size; row++) {
        pln_row_set(dst[row], src[row], size);
    }
}

void pln_mat_set_arr(pln_mat_t dst, unsigned int *src, size_t size) {
    size_t index = 0;
    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            r_pln_set_ui(&dst[row][col], src[index++]);
        }
    }
}

void pln_mat_from_pln(pln_mat_t rop, pln_t pln) {
    size_t size = pln_mat_size(pln);

    for (int i = 0; i < size; i++) {
        r_pln_set_ui(&rop[0][i], pln_tstbit(pln, i + 1));
    }

    for (int row = 1; row < size; row++) {
        for (int col = 0; col < size; col++) {
            unsigned int value = row - 1 == col ? 0b1 : 0b0;
            r_pln_set_ui(&rop[row][col], value);
        }
    }
}

void pln_mat_clear(pln_mat_t op, size_t size) {
    for (int i = 0; i < size; i++) {
        pln_row_clear(op[i], size);
    }

    free(op);
}

// Arithmetics

void pln_mat_add(pln_mat_t rop, pln_mat_t op1, pln_mat_t op2, size_t size) {
    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            r_pln_add(&rop[row][col], op1[row][col], op2[row][col]);
        }
    }
}

void pln_mat_mul(pln_mat_t rop, pln_mat_t op1, pln_mat_t op2, size_t size) {
    r_pln_t mul_rop;
    r_pln_init(&mul_rop);
    r_pln_t calc_val;
    r_pln_init(&calc_val);
    pln_mat_t internal_rop;
    pln_mat_init(&internal_rop, size);

    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            r_pln_set_ui(&calc_val, 0b0);

            for (int i = 0; i < size; i++) {
                r_pln_mul(&mul_rop, op1[row][i], op2[i][col]);
                r_pln_add(&calc_val, calc_val, mul_rop);
            }

            r_pln_set(&internal_rop[row][col], calc_val);
        }
    }

    pln_mat_set(rop, internal_rop, size);
    pln_mat_clear(internal_rop, size);
    r_pln_clear(calc_val);
    r_pln_clear(mul_rop);
}

void pln_mat_mul_ui(pln_mat_t rop, pln_mat_t op1, unsigned int op2, size_t size) {
    r_pln_t pln_op2;
    r_pln_init_set_ui(&pln_op2, op2);

    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            r_pln_mul(&rop[row][col], op1[row][col], pln_op2);
        }
    }

    r_pln_clear(pln_op2);
}

void pln_mat_add_identity_mul_ui(pln_mat_t rop, pln_mat_t op1, unsigned int op2, size_t size) {
    r_pln_t pln_op2;
    r_pln_init_set_ui(&pln_op2, op2);

    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            if (row == col) {
                r_pln_add(&rop[row][col], op1[row][col], pln_op2);
            }
            else {
                r_pln_set(&rop[row][col], op1[row][col]);
            }
        }
    }

    r_pln_clear(pln_op2);
}

void pln_mat_pow(pln_mat_t rop, pln_mat_t op, unsigned int power, size_t size) {
    pln_mat_set(rop, op, size);
    for (int i = 1; i < power; i++) {
        pln_mat_mul(rop, rop, op, size);
    }
}

void pln_mat_optimized_pow(pln_mat_t rop, pln_mat_t op, unsigned int power, size_t size) {
    pln_row_t first_row = op[0];
    pln_mat_t internal_rop;
    pln_mat_init(&internal_rop, size);
    pln_mat_set(internal_rop, op, size);

    for (int i = 0; i < size; i++) {
        int power_left = power - 1;
        pln_row_t row = internal_rop[i];
        while (power_left > 0) {
            power_left--;

            r_pln_t dropped_item = pln_row_lshift(row, size);

            if (r_pln_cmp_ui(&dropped_item, 0b1) == 0) {
                for (int j = 0; j < size; j++) {
                    r_pln_add(&row[j], row[j], first_row[j]);
                }
            }
        }
    }

    pln_mat_set(rop, internal_rop, size);
}

// Logical

int pln_mat_cmp(pln_mat_t op1, pln_mat_t op2, size_t size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (r_pln_cmp(&op1[i][j], op2[i][j]) != 0) {
                return -1;
            }
        }
    }

    return 0;
}

// Determinant

void pln_mat_to_u(pln_mat_t rop, pln_mat_t op, size_t size) {
    if (rop != op) {
        pln_mat_set(rop, op, size);
    }
    r_pln_t factor;
    r_pln_init(&factor);
    r_pln_t calc_val;
    r_pln_init(&calc_val);

    for (size_t i = 0; i < size; i++) {
        for (size_t j = i + 1; j < size; j++) {
            r_pln_div(&factor, rop[j][i], rop[i][i]);

            for (size_t k = i; k < size; k++) {
                r_pln_mul(&calc_val, factor, rop[i][k]);
                r_pln_sub(&rop[j][k], rop[j][k], calc_val);
                r_pln_reduce(&rop[j][k], rop[j][k]);
            }
        }
    }

    r_pln_clear(calc_val);
    r_pln_clear(factor);
}

void pln_mat_get_determinant(r_pln_t *rop, pln_mat_t op, size_t size) {
    r_pln_set_ui(rop, 0b1);

    for (int i = 0; i < size; i++) {
        r_pln_mul(rop, *rop, op[i][i]);
    }
}

int pln_mat_check_u(pln_mat_t op, size_t size) {
    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            if (row > col && r_pln_cmp_ui(&op[row][col], 0b0)) {
                return -1;

            }
        }
    }

    return 0;
}

// Conversion

mp_bitcnt_t pln_mat_str_size(pln_mat_t op, size_t size, int base) {
    mp_bitcnt_t str_size = 0;
    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            str_size += r_pln_str_size(op[row][col], base);
        }
    }

    str_size += size - 1; // '\n'
    str_size += (size - 1) * size; // ''

    return str_size;
}

mp_bitcnt_t pln_mat_get_str(char *str, pln_mat_t op, size_t size, int base) {
    mp_bitcnt_t str_index = 0;
    for (int row = 0; row < size; row++) {
        for (int col = 0; col < size; col++) {
            r_pln_get_str(str + sizeof(char) * str_index, op[row][col], base);
            str_index += r_pln_str_size(op[row][col], base);

            if (col != size - 1) {
                str[str_index++] = ' ';
            }
        }

        if (row != size - 1) {
            str[str_index++] = '\n';
        }
    }

    str[str_index] = 0;

    return str_index;
}
