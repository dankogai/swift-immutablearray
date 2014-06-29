//
//  main.swift
//  immutablearray
//
//  Created by Dan Kogai on 6/29/14.
//  Copyright (c) 2014 Dan Kogai. All rights reserved.
//

let a  = [0,1,2,3]
let ia = ImmutableArray(a)
assert(!ia.isEmpty)
assert(ia.count == 4)
for i in 0..ia.count {
    assert(ia[i] == i)
}
for (i, v) in enumerate(ia) {
    assert(i == v)
}
a[3] += 1
assert(a  == [0,1,2,4])
assert(ia == [0,1,2,3])
assert(ia != [0,1,2,4])
assert(ia == ImmutableArray(0,1,2,3))
assert(ia.map{ $0 * $0 } == [0,1,4,9])
assert(ia.filter{ $0 % 2 == 0 } == [0,2])
assert(ia.reduce(0){ $0 + $1 } == 6)
assert(ia.reverse() == [3,2,1,0])
