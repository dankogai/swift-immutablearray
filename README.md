swift-immutablearray
====================

A really immutable array for Swift

Immutable array with mutable elements?
----

This is probably the most notorious feature of Swift.

````swift
let mutableElements =  [0, 1, 2, 3]
println(mutableElements)    // [0, 1, 2, 3]
for i in 0..mutableElements.count { mutableElements[i] *= -1 }
println(mutableElements)    // [0, -1, -2, -3]
````

Though this behavior is well-documented in [The Swift Programming Language],  you may still need a truly immutable array

[The Swift Programming Language]: https://itun.es/gb/jEUH0.l

Swifty Workaround
-----------------

The easiest workaround is to make use of one of the best features of Swift -- Every block is a closure.

````
let reallyImmutable = {[0,1,2,3]}
for i in 0..reallyImmutable().count { reallyImmutable()[i] *= -1 }
println(reallyImmutable())      // [0, 1, 2, 3]
println(reallyImmutable()[2])   // 2
let anotherImmutable = { reallyImmutable().map{ $0 * $0 } }
println(anotherImmutable())     // [0, 1, 4, 9]
````

This workaround has two drawbacks.

0.  You have to pay extra two characters for each declearation (`{}`) and invocation (`()`).
1.  A (futile) attempt to change the element does not emit a compile error

Fortunately the solution is simple and easy.  Just write a wrapper type.
