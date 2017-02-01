//
//  PolynomialOperations.h
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 12/29/16.
//  Copyright © 2016 Yuriy Tolstoguzov. All rights reserved.
//

#ifndef PolynomialOperations_h
#define PolynomialOperations_h

#include <stdio.h>
#include <stdbool.h>

#include "gmp.h"

#define pln_t mpz_t
#define pln_ptr mpz_ptr
#define pln_srcptr mpz_srcptr
#define pln_init(pln) mpz_init(pln)
#define pln_init_set_ui(rop, op) mpz_init_set_ui(rop, op)
#define pln_set(rop, op) mpz_set(rop, op)
#define pln_set_ui(rop, op) mpz_set_ui(rop, op)
#define pln_clear(pln) mpz_clear(pln)

// Arithmetics

#define pln_add(rop, op1, op2) mpz_xor(rop, op1, op2)
#define pln_sub(rop, op1, op2) mpz_xor(rop, op1, op2)
void pln_mul(pln_t rop, pln_t op1, pln_t op2);
void pln_div(pln_t q, pln_t r, pln_t op1, pln_t op2);

// Logical

#define pln_cmp(op1, op2) mpz_cmp(op1, op2)
#define pln_cmp_ui(op1, op2) mpz_cmp_ui(op1, op2)
#define pln_shift_left(rop, op1, op2) mpz_mul_2exp(rop, op1, op2)
#define pln_shift_right(rop, op1, op2) mpz_div_2exp(rop, op1, op2)
#define pln_tstbit(src, op) mpz_tstbit(src, op)
#define pln_swap(op1, op2) mpz_swap(op1, op2)

// Conversion

mp_bitcnt_t pln_get_pretty_str(char *str, mpz_t pln);
mp_bitcnt_t pln_pretty_str_size(pln_t pln);
#define pln_set_str(rop, src, base) mpz_set_str(rop, src, base)
#define pln_get_str(dst, base, pln) mpz_get_str(dst, base, pln)
#define pln_sizeinbase(op, base) mpz_sizeinbase(op, base)

#endif /* PolynomialOperations_h */
