//
//  PolynomialRow.h
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/22/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#ifndef PolynomialRow_h
#define PolynomialRow_h

#include "RationalPolynomialOperations.h"

#define pln_row_t r_pln_t*

// Init

void pln_row_init(pln_row_t *op_ptr, size_t size);
void pln_row_set(pln_row_t dst, pln_row_t src, size_t size);
void pln_row_clear(pln_row_t op, size_t size);

r_pln_t pln_row_lshift(pln_row_t row, size_t size);

#endif /* PolynomialRow_h */
