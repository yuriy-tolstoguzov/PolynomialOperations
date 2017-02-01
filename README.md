# What is it

It's a library for multiple precision operation under [finite field or Galois field](https://en.wikipedia.org/wiki/Finite_field) of order 2. Since our computers use bits with 2 values Galois field is a good representation of separate component of a computer, think about adders, multiplier and other digital curcuits.

# What is implemented

Currently implemented next types:

* Polinomial type;
* Rational polynomial type;
* Array of polynomials type;
* Matrix of polynomails type.

And next operations:

* Addition(same as substraction);
* Multiplication;
* Division;
* Conversion to/from string or number;
* Comparison
* Decimation of polinomials.

Polinomials can be any length, the only limitation I can think of: the pretty string method for polynomials assumes that the highest order fits in 9 chars in base 10.

# Code style

Code style is pretty much follow what GMPLIB uses.

# How to build

The only way to build lib now - use Xcode to do so.
