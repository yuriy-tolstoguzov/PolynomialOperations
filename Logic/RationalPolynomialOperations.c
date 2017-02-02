//
//  RationalPolynomialOperations.c
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/21/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#include "RationalPolynomialOperations.h"
#include <string.h>
#include <stdbool.h>

void r_pln_init(r_pln_t *pln_ptr) {
    pln_init((*pln_ptr).numerator);
    pln_init((*pln_ptr).denominator);
}

void r_pln_init_set_ui(r_pln_t *pln_ptr, unsigned int op) {
    pln_init_set_ui((*pln_ptr).numerator, op);
    pln_init_set_ui((*pln_ptr).denominator, 0b1);
}

void r_pln_set_ui(r_pln_t *pln_ptr, unsigned int op) {
    pln_set_ui((*pln_ptr).numerator, op);
    pln_set_ui((*pln_ptr).denominator, 0b1);
}

void r_pln_set(r_pln_t *dst_ptr, r_pln_t src) {
    pln_set((*dst_ptr).numerator, src.numerator);
    pln_set((*dst_ptr).denominator, src.denominator);
}

void r_pln_clear(r_pln_t op) {
    pln_clear(op.numerator);
    pln_clear(op.denominator);
}

// Arithmetics

void r_pln_add(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2) {
    if (pln_cmp_ui(op1.numerator, 0) == 0) {
        r_pln_set(rop_ptr, op2);
        return;
    } else if (pln_cmp_ui(op2.numerator, 0) == 0) {
        r_pln_set(rop_ptr, op1);
        return;
    }

    if (pln_cmp(op1.denominator, op2.denominator) == 0) {
        pln_add((*rop_ptr).numerator, op1.numerator, op2.numerator);
        pln_set((*rop_ptr).denominator, op1.denominator);
        return;
    }
    
    pln_t equalizedOp1;
    pln_init(equalizedOp1);
    pln_mul(equalizedOp1, op1.numerator, op2.denominator);

    pln_t equalizedOp2;
    pln_init(equalizedOp2);
    pln_mul(equalizedOp2, op1.denominator, op2.numerator);

    pln_add((*rop_ptr).numerator, equalizedOp1, equalizedOp2);
    pln_mul((*rop_ptr).denominator, op1.denominator, op2.denominator);

    pln_clear(equalizedOp1);
    pln_clear(equalizedOp2);
}


void r_pln_mul(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2) {
    pln_mul((*rop_ptr).numerator, op1.numerator, op2.numerator);
    pln_mul((*rop_ptr).denominator, op1.denominator, op2.denominator);
}

void r_pln_div(r_pln_t *rop_ptr, r_pln_t op1, r_pln_t op2) {
    pln_mul((*rop_ptr).numerator, op1.numerator, op2.denominator);
    pln_mul((*rop_ptr).denominator, op1.denominator, op2.numerator);
}

// Logical

int r_pln_cmp(r_pln_t *op1, r_pln_t op2) {
    bool is_op1_d_zero = pln_cmp_ui(op1->denominator, 0) == 0;
    bool is_op2_d_zero = pln_cmp_ui(op2.denominator, 0) == 0;
    if ((is_op1_d_zero && !is_op2_d_zero)
        || (is_op2_d_zero && !is_op1_d_zero)) {
        return 1;
    }

    bool is_op1_n_zero = pln_cmp_ui(op1->numerator, 0) == 0;
    bool is_op2_n_zero = pln_cmp_ui(op2.numerator, 0) == 0;
    if ((is_op1_n_zero && !is_op2_n_zero)
        || (is_op2_n_zero && !is_op1_n_zero)) {
        return 1;
    }

    r_pln_t sub;
    r_pln_init(&sub);
    r_pln_sub(&sub, *op1, op2);

    int rop = r_pln_cmp_ui(&sub, 0);

    r_pln_clear(sub);

    return rop;
}

int r_pln_cmp_ui(r_pln_t *op1, unsigned int op2) {
    if (op2 == 0) {
        return pln_cmp_ui(op1->numerator, op2);
    }

    r_pln_reduce(op1, *op1);
    return (pln_cmp_ui(op1->denominator, 1) == 0
            ? pln_cmp_ui(op1->numerator, op2)
            : 1);
}

void r_pln_lshift(r_pln_t *rop_ptr, r_pln_t op1, unsigned int op2) {
    pln_shift_left((*rop_ptr).numerator, op1.numerator, op2);
    pln_set((*rop_ptr).denominator, op1.denominator);
}

void r_pln_rshift(r_pln_t *rop_ptr, r_pln_t op1, unsigned int op2) {
    pln_shift_right((*rop_ptr).numerator, op1.numerator, op2);
    pln_set((*rop_ptr).denominator, op1.denominator);
}

void r_pln_swap(r_pln_t *op1_ptr, r_pln_t *op2_ptr) {
    pln_swap((*op1_ptr).numerator, (*op2_ptr).numerator);
    pln_swap((*op1_ptr).denominator, (*op2_ptr).denominator);
}

// Conversion

void r_pln_reduce(r_pln_t *rop_ptr, r_pln_t op) {
    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);

    pln_div(q, r, op.numerator, op.denominator);

    if (pln_cmp_ui(r, 0) == 0) {
        pln_set((*rop_ptr).numerator, q);
        pln_set_ui((*rop_ptr).denominator, 1);
    }

    pln_clear(q);
    pln_clear(r);
}

mp_bitcnt_t r_pln_get_pretty_str(char *r, r_pln_t pln) {
    mp_bitcnt_t str_index = pln_get_pretty_str(r, pln.numerator);

    r[str_index++] = ' ';
    r[str_index++] = '/';
    r[str_index++] = ' ';

    char *d = r + sizeof(char) * str_index;

    str_index += pln_get_pretty_str(d, pln.denominator);

    return str_index;
}

mp_bitcnt_t r_pln_pretty_str_size(r_pln_t pln) {
    mp_bitcnt_t num_size = pln_pretty_str_size(pln.numerator);
    mp_bitcnt_t den_size = pln_pretty_str_size(pln.denominator);
    mp_bitcnt_t str_size = num_size + den_size + 3; // size of ' / '

    return str_size;
}

int r_pln_set_str(r_pln_t *rop_ptr, char *src, int base) {
    pln_set_ui((*rop_ptr).denominator, 0b1);
    return pln_set_str((*rop_ptr).numerator, src, base);
}

char* r_pln_get_str(char *dst, r_pln_t pln, int base) {
    char *r = pln_get_str(dst, base, pln.numerator);
    size_t str_index = strlen(r);

    r[str_index++] = '/';

    char *den = r + sizeof(char) * str_index;

    return pln_get_str(den, base, pln.denominator);
}

mp_bitcnt_t r_pln_str_size(r_pln_t pln, int base) {
    mp_bitcnt_t num_size = pln_sizeinbase(pln.numerator, base);
    mp_bitcnt_t den_size = pln_sizeinbase(pln.denominator, base);
    mp_bitcnt_t str_size = num_size + den_size + 1; // size of '/'

    return str_size;
}
