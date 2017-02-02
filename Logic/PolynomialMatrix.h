//
//  PolynomialMatrix.h
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/21/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#ifndef PolynomialMatrix_h
#define PolynomialMatrix_h

#include "PolynomialRow.h"

#define pln_mat_t r_pln_t**

// Init

size_t pln_mat_size(pln_t pln);
void pln_mat_init(pln_mat_t *op_ptr, size_t size);
void pln_mat_set(pln_mat_t dst, pln_mat_t src, size_t size);
void pln_mat_set_arr(pln_mat_t dst, unsigned int *src, size_t size);
void pln_mat_from_pln(pln_mat_t rop, pln_t pln);
void pln_mat_clear(pln_mat_t op, size_t size);

// Arithmetics

void pln_mat_add(pln_mat_t rop, pln_mat_t op1, pln_mat_t op2, size_t size);
void pln_mat_mul(pln_mat_t rop, pln_mat_t op1, pln_mat_t op2, size_t size);
void pln_mat_mul_ui(pln_mat_t rop, pln_mat_t op1, unsigned int op2, size_t size);
void pln_mat_add_identity_mul_ui(pln_mat_t rop, pln_mat_t op1, unsigned int op2, size_t size);
void pln_mat_pow(pln_mat_t rop, pln_mat_t op1, unsigned int op2, size_t size);
// Works only with single 1 in rows except first one
void pln_mat_optimized_pow(pln_mat_t rop, pln_mat_t op, unsigned int power, size_t size);

// Logical

int pln_mat_cmp(pln_mat_t op1, pln_mat_t op2, size_t size);

// Determinant

void pln_mat_to_u(pln_mat_t rop, pln_mat_t op, size_t size);
void pln_mat_get_determinant(r_pln_t *rop, pln_mat_t op, size_t size);
int pln_mat_check_u(pln_mat_t op, size_t size);

// Conversion

mp_bitcnt_t pln_mat_str_size(pln_mat_t op, size_t size, int base);
mp_bitcnt_t pln_mat_get_str(char *str, pln_mat_t op, size_t size, int base);

#endif /* PolynomialMatrix_h */
