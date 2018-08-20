# Validation using Applicatives

This is just a small show case how to use the magic powers
of Haskell's applicatives to implement a readable validation.

## Idea

We implement field-wise validation and
then chain it together using both fmap and ap.

By using the validation package we can even
output validation errors!

## Further information

* Great blog post at Codurance about this topic in two parts:
  * [Part 1](https://codurance.com/2017/11/30/applicatives-validation/)
  * [Part 2](https://codurance.com/2018/01/11/applicatives-validation/)
* [Vavr's Validation API](https://www.vavr.io/vavr-docs/#_validation)
* [FP-TS Validation](https://github.com/gcanti/fp-ts/blob/master/src/Validation.ts)
* [Arrow-Kt Validated](https://arrow-kt.io/docs/datatypes/validated/)
