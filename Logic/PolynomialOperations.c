//
//  PolynomialOperations.c
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 12/29/16.
//  Copyright © 2016 Yuriy Tolstoguzov. All rights reserved.
//

#include "PolynomialOperations.h"

// Arithmetics

void pln_mul(pln_t rop, pln_t op1, pln_t op2) {
    size_t firstOpSize = mpz_sizeinbase(op1, 2);
    mpz_t internal_rop;
    mpz_init(internal_rop);
    mpz_t shiftedOp2;
    mpz_init(shiftedOp2);

    for(mp_bitcnt_t i = 0; i < firstOpSize; i++) {
        if (mpz_tstbit(op1, i)) {
            mpz_set(shiftedOp2, op2);
            mpz_mul_2exp(shiftedOp2, shiftedOp2, i);
            mpz_xor(internal_rop, internal_rop, shiftedOp2);
        }
    }

    mpz_clear(shiftedOp2);

    mpz_set(rop, internal_rop);
    mpz_clear(internal_rop);
}

void pln_div(pln_t q, pln_t r, pln_t op1, pln_t op2) {
    if (mpz_cmp(op1, op2) < 0) {
        mpz_set_ui(q, 0);
        mpz_set(r, op1);
        return;
    }

    mpz_t internal_q;
    mpz_init_set_ui(internal_q, 0b0);
    mpz_t internal_r;
    mpz_init_set(internal_r, op1);

    mpz_t subtrahend;
    mpz_init(subtrahend);
    size_t rSize = mpz_sizeinbase(internal_r, 2);
    size_t op2Size = mpz_sizeinbase(op2, 2);
    while (rSize >= op2Size) {
        size_t diff = rSize - op2Size;
        mpz_setbit(internal_q, diff);
        if (diff == 0) {
            mpz_set(subtrahend, op2);
        }
        else {
            mpz_mul_2exp(subtrahend, op2, diff);
        }
        mpz_xor(internal_r, internal_r, subtrahend);
        rSize = mpz_cmp_ui(internal_r, 0) == 0 ? 0 : mpz_sizeinbase(internal_r, 2);
    }
    mpz_clear(subtrahend);

    mpz_set(q, internal_q);
    mpz_set(r, internal_r);
    mpz_clear(internal_q);
    mpz_clear(internal_r);
}

// Conversion

mp_bitcnt_t pln_get_pretty_str(char *str, mpz_t pln) {
    mp_bitcnt_t str_index = 0;
    size_t size = mpz_sizeinbase(pln, 2);
    for (size_t i = 0; i < size; i++) {
        size_t bitToTest = size - i - 1;
        if (mpz_tstbit(pln, bitToTest)) {
            if (str_index != 0) {
                str[str_index++] = ' ';
                str[str_index++] = '+';
                str[str_index++] = ' ';
            }

            if (bitToTest == 0) {
                str[str_index++] = '1';
            }
            else {
                str[str_index++] = 'x';
                str[str_index++] = '^';
                char bitStr[10];
                sprintf(bitStr, "%zu", bitToTest);

                int bitStrIndex = 0;
                while (bitStr[bitStrIndex] != 0) {
                    str[str_index++] = bitStr[bitStrIndex++];
                }
            }
        }
    }

    if (str_index == 0) {
        str[str_index++] = '0';
    }

    str[str_index] = 0;

    return str_index;
}

mp_bitcnt_t pln_pretty_str_size(mpz_t pln) {
    return sizeof(char) * mpz_popcount(pln) * 9; // "x^1234 + "
}
