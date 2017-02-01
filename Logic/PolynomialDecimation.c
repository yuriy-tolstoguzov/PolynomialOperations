//
//  PolynomialDecimation.c
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
#include "PolynomialDecimation.h"

void pln_decimate(pln_t *rop, pln_t op1, unsigned int op2) {
    size_t size = pln_mat_size(op1);
    pln_mat_t init_mat;
    pln_mat_init(&init_mat, size);
    pln_mat_from_pln(init_mat, op1);

#ifdef PLN_ENABLE_LOGGING
    printf("%s", "\nINIT MATRIX:\n");
    mp_bitcnt_t str_size = pln_mat_str_size(init_mat, size, 2);
    char str[str_size];
    pln_mat_get_str(str, init_mat, size, 2);
    printf("%s", str);
#endif

    pln_mat_t pow_mat;
    pln_mat_init(&pow_mat, size);
    pln_mat_optimized_pow(pow_mat, init_mat, op2, size);
    pln_mat_clear(init_mat, size);

#ifdef PLN_ENABLE_LOGGING
    printf("%s", "\nPOW MATRIX:\n");
    str_size = pln_mat_str_size(pow_mat, size, 2);
    char str1[str_size];
    pln_mat_get_str(str1, pow_mat, size, 2);
    printf("%s", str1);
#endif

    pln_mat_t dec_mat;
    pln_mat_init(&dec_mat, size);
    pln_mat_add_identity_mul_ui(dec_mat, pow_mat, 0b10, size);
    pln_mat_clear(pow_mat, size);

#ifdef PLN_ENABLE_LOGGING
    printf("%s", "\nDECIMATED MATRIX:\n");
    str_size = pln_mat_str_size(dec_mat, size, 2);
    char str2[str_size];
    pln_mat_get_str(str2, dec_mat, size, 2);
    printf("%s", str2);
#endif

    pln_mat_t u_mat;
    pln_mat_init(&u_mat, size);
    pln_mat_to_u(u_mat, dec_mat, size);
    pln_mat_clear(dec_mat, size);

#ifdef PLN_ENABLE_LOGGING
    printf("%s", "\nUPPER TRIANGULAR MATRIX:\n");
    str_size = pln_mat_str_size(u_mat, size, 2);
    char str3[str_size];
    pln_mat_get_str(str3, u_mat, size, 2);
    printf("%s", str3);
#endif

    r_pln_t r_rop;
    r_pln_init(&r_rop);
    pln_mat_get_determinant(&r_rop, u_mat, size);
    pln_mat_clear(u_mat, size);

    r_pln_reduce(&r_rop, r_rop);

    pln_set(*rop, r_rop.numerator);
    r_pln_clear(r_rop);
}
