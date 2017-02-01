//
//  RationalPolynomialOperations.h
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/20/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#ifndef RationalPolynomialOperations_h
#define RationalPolynomialOperations_h

#include <string.h>

#include "PolynomialOperations.h"

typedef struct {
    pln_t numerator;
    pln_t denominator;
} r_pln_t;

void r_pln_init(r_pln_t *pln_ptr);
void r_pln_init_set_ui(r_pln_t *pln_ptr, unsigned int op);
void r_pln_set_ui(r_pln_t *pln_ptr, unsigned int op);
void r_pln_set(r_pln_t *dst_ptr, r_pln_t src);
void r_pln_clear(r_pln_t op);

// Arithmetics

void r_pln_add(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2);
#define r_pln_sub(rop, op1, op2) r_pln_add(rop, op1, op2)
void r_pln_mul(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2);
void r_pln_div(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2);

// Logical

int r_pln_cmp(r_pln_t *op1, r_pln_t op2);
int r_pln_cmp_ui(r_pln_t *op1, unsigned int op2);
void r_pln_lshift(r_pln_t *rop_ptr, r_pln_t op1, unsigned int op2);
void r_pln_rshift(r_pln_t *rop_ptr, r_pln_t op1, unsigned int op2);
void r_pln_swap(r_pln_t *op1_ptr, r_pln_t *op2_ptr);

// Conversion

void r_pln_reduce(r_pln_t *rop, r_pln_t op);
mp_bitcnt_t r_pln_get_pretty_str(char *r, r_pln_t pln);
mp_bitcnt_t r_pln_pretty_str_size(r_pln_t pln);
int r_pln_set_str(r_pln_t *rop_ptr, char *src, int base);
char* r_pln_get_str(char *dst, r_pln_t pln, int base);
mp_bitcnt_t r_pln_str_size(r_pln_t pln, int base);

#endif /* RationalPolynomialOperations_h */
