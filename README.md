# StateSpecs

[![GitHub release](https://img.shields.io/github/release/dionisiydk/StateSpecs.svg)](https://github.com/dionisiydk/StateSpecs/releases/latest)
[![Unit Tests](https://github.com/dionisiydk/StateSpecs/actions/workflows/tests.yml/badge.svg)](https://github.com/dionisiydk/StateSpecs/actions/workflows/tests.yml)

[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-informational)](https://pharo.org)

StateSpecs is object state specification framework. It describes particular object states by first class specifications.
For example there are SpecOfCollectionItem, SpecOfObjectClass and SpecOfObjectSuperclass.
StateSpecs provides fluent DSL to validate objects over these specification.

## Installation
Use following script for Pharo version >= 6:
```Smalltalk
Metacello new
  baseline: 'StateSpecs';
  repository: 'github://dionisiydk/StateSpecs';
  load
```
To add dependency in your project baseline:
```Smalltalk
spec
    baseline: 'StateSpecs'
    with: [ spec repository: 'github://dionisiydk/StateSpecs:versionTagOrBranch' ]
```
For old Pharo versions project should be loaded from smalltalkhub:
```Smalltalk
Metacello new
      smalltalkhubUser: 'dionisiy' project: 'StateSpecs';
      configuration: 'StateSpecs';
      version: #stable;
      load.
```
## Basic

Specifications can match and validate objects. In case when object does not satisfied a specification you will get failure result with detailed information about the problem.
For example try create SpecOfObjectClass and validate objects over it.

```Smalltalk
spec := SpecOfObjectClass requiredClass: SmallInteger.
spec validate: 10. "==> a SpecOfValidationSuccess"
spec validate: 'some string'. "==> a SpecOfValidationFailure(Got 'some string' but it should be an instance of SmallInteger)"
```

Instead of validation you can simply match objects for specification to get true or false:

```Smalltalk
spec matches: 10. "==> true"
spec matches: "string". "==> false"
```

Specifications can be inverted by *#not* message:

```Smalltalk
spec not validate: 10.  "==> a SpecOfValidationFailure(Got 10 but it should not be an instance of SmallInteger)"
spec not validate: 'some string'. "==> a SpecOfValidationSuccess"
```

*#not* creates new spec instance. You can also invert current one with message *#invert*.


To easily create specifications and validate objects by them StateSpecs provides two kind DSL: should expressions and "word" classes.

First allows you to write "assertions":

```Smalltalk
1 should be: 2
1 should equal: 10
```

which create particular kind of specification and verify receiver over it.


And second allows you to instantiate specs by natural readable words:

```Smalltalk
Kind of: Number. "==> a SpecOfObjectSuperclass(should be a kind of Number)"
Instance of: String. "==> a SpecOfObjectClass(should be an instance of String)"
Equal to: 'test'. "==> a SpecOfEquality(should equal 'test')"
```

Word classes were introduced to get fluent interface for mock expectations (mock stub someMessage: (Kind of: String)).

But they are very handy shorcuts to access specifications in general. Same word can return different specifications in different expressions which allows very fluent instantiation interface:

```Smalltalk
Equal to: 'test'. "==> a SpecOfEquality(should equal 'test')"
Equal to: 10.0123 within: 0.01. "==>  a SpecOfApproxEquality(should be within 0.01 of 10.0123)"
```

## Should expressions

Underhood should expression creates particular kind of specification and verify receiver over it.

When object is not valid should expression signals SpecOfFailed error. Then in debugger you can inspect validation result to deeply analyze the reason.

Sending extra *#not* message after *should* inverts logic of following expression:

```Smalltalk
3 should not equal: 3. "fail with message: Got '3' but it should not equal '3'"
```

Should expressions were created with the goal to replace SUnit assertions (self assert: a = b).
They were originally invented by Dave Astels in project SSpec as part of general rethinking of TDD methodology in flavor of BDD.
Nowdays SSpec approach was ported to many languages (NSpec in C#, RSpec in Ruby for example).

StateSpecs provides clean implementation for should expressions on top of first class specifications. It uses more pragmatic approach for "should syntax" to avoid magic over expressions to make them more explorable with standart development tools.

To explore complete set of expressions look at SpecOfShouldExpression. It is also place where to extend them. SpecOfShouldExpressionTests describes them in tests.

### Specification of object identity

*#be:* message is used to verify that receiver is identical to given argument:

```Smalltalk
1 should be: 2.
```

It fails with message: Got "1" but it should be "2".

```Smalltalk
1 should not be: 1.
```

It fails with message: Got "1" but it should not be "1".

### Specification of object equality

*#equal:* message is used to verify that receiver is equivalent to given argument:

```Smalltalk
3 should equal: 2.
```

It fails with message: Got "3" but it should equal "2".

```Smalltalk
3 should not equal: 3.
```

It fails with message: Got "3" but it should not equal "3"


Language equality operation #= is redefined by many classes according to domain logic. Sometimes they check a lot of conditions to compare objects.
Problem that it can be not suitable from the point of view of specification. Imaging that we want compare two collection of different type:

```Smalltalk
#(1 2 3) asOrderedCollection = #(1 2 3). "==>false"
```

It returns false which is correct from the point of view of collection library. But what we would expect from specification?

```Smalltalk
#(1 2 3) asOrderedCollection should equal: #(1 2 3).
```

It would be not suitable to fail because it will force us to always think about collection type when we would like assert their equality.
In fact we are supposed to assert collection items with this expression and not instances of collections.


So this expression will not fail in StateSpecs. And to achieve it equality specification uses specific message *#checkStateSpecsEqualityTo:* instead of standart #=.
Default Object implementation calls #=. But some classes redefine it with appropriate logic to provide as less restrictive behaviour as possible.

Idea is that general equality specification should be as much simple equality as possible with enough restrictions. And if you want some extra details you should use different explicit specification which describes them.
In case of collections you should check for collection class explicitly if it is important for your business case where you use specification:

```Smalltalk
actual := #(1 2 3) asOrderedCollection.
expected := #(1 2 3).

actual should beInstanceOf: expected class.
actual should equal: expected.
```

Following this logic StateSpecs do not check order when compare basic collection classes:

```Smalltalk
#(1 2 3) should equal: #(2 1 3). "will not fail"
#(1 2 3) asSet should equal: #(2 1 3). "will not fail"
```

When order is important use different message *#equalInOrder:*:

```Smalltalk
#(1 2 3) asOrderedCollection should equalInOrder: #(2 1 3).
```

It fails with message: Got "#(1 2 3)" but it should equal in order to "#(2 1 3)".


There are collection classes like String or ByteArray which are supposed to be in order and which type is important. For them theses properties are always taken into account for equality comparison:

```Smalltalk
'123' should equal: #($1 $2 $3).
```

It fails with message: Got '123' but it should equal "#($1 $2 $3)".

```Smalltalk
'123' should equal: '132'.
```

It fails with message: Got '123' but it should equal '132'.


Floats are another example where specification behaves differently then standart language comparison:

```Smalltalk
0.1 + 0.2 = 0.3 "==> false"
```

It is correct result because of rounding errors in float arithmetics. But it is completelly not suitable to be part of specification. So in StateSpecs following expression will succeed:

```Smalltalk
(0.1 + 0.2) should equal: 0.3  "==> will not fail"
```

Float implements *#checkStateSpecsEqualityTo:* by comparing numbers with default accuracy.


And there is special specification for floats when concrete accuracy is important:

```Smalltalk
10.123 should equal: 10.1 within: 0.1  "==> will not fail"
10.123 should equal: 10.1 within: 0.01 "==> will fail"
```

Last expression fails with message: Got 10.123 but it should be within 0.01 of 10.1.


Same logic is used by equality specification of Point class.

### Specification of class relationship

```Smalltalk
3 should beKindOf: String.
```

It will fail with message: Got 3 but it should be a kind of String.

```Smalltalk
3 should beInstanceOf: String.
```

It will fail with message: Got 3 but it should be an instance of String.

### Specifications of collection

To specify size of expected collection use *#haveSize:* message:

```Smalltalk
#(1 2) should haveSize: 10.
```

It fails with message: Got #(1 2) but it should have 10 elements.


There is simple expression for empty collections:

```Smalltalk
#(1 2) should be isEmpty
```

It fails with message: #(1 2) should be isEmpty. It uses predicate syntax explained below at *@predicate*.


To require concrete item in collection use one of *#include:* messages:

```Smalltalk
#(1 2) should include: 10.
```

If fails with message: Got #(1 2) but it should include 10.

```Smalltalk
#(1 2) should include: 10 at: 1.
```

It fails with message: Got 1 at key 1 of #(1 2) but should equal 10.


Argument of include messages can be specification itself:

```Smalltalk
#(1 2) should include: (Instance of: String) at: 1.
```

It fails with message: Got 1 at key 1 of #(1 2) but should be an instance of String.

```Smalltalk
#(1 2) should include: (Instance of: String)
```

It fails with message: Got #(1 2) but should include (be an instance of String).

```Smalltalk
#(1 2) should include: [:each | each > 1]
```

It is succeed without error.


To specify expected key in dictionary use *#includeKey:* message:

```Smalltalk
{ #key1 -> #value1 } asDictionary should includeKey: #key2
```

It fails with message: Got a Dictionary{#key1->#value1} but it should include key #key2

### Specifications of string

To specify the substring of expected string use ==includeSubstring:== message:

```Smalltalk
'some test string' should includeSubstring: 'test2'
```

It fails with message: Got 'some test string' but it should include 'test2'.


To specify prefix of expected string use ==beginWith:== message:

```Smalltalk
'string for test' should beginWith: 'test'
```

It fails with message: Got 'string for test' but it should begin with 'test'.


To specify suffix of expected string use ==endWith:== message:

```Smalltalk
'test string' should endWith: 'test'
```

It fails with message: Got 'test string' but it should end with 'test'.


To specify regex expression which expected string should satisfy use ==matchRegex:== message:

```Smalltalk
'string for test' should matchRegex: '^test'
```

It fails with message: Got 'string for test' but it should match regex '^test'.


By default all this specifications validate strings ignoring case.
If you want case sensitive specs just add ==caseSensitive: true== keyword to all examples:

```Smalltalk
'some test string' should includeSubstring: 'Test' caseSensitive: true
'test string' should beginWith: 'Test' caseSensitive: true
'string for test' should endWith: 'Test' caseSensitive: true
'test string' should matchRegex: '^Test' caseSensitive: true
```

### Raising exception

*#raise:* message allows specify expected failure of given block:

```Smalltalk
[1 + 2] should raise: ZeroDivide.
```

It fails with message: Got no failures but should be an instance of ZeroDivide.

```Smalltalk
[1/0] should not raise: ZeroDivide.
```

It fails with message: Got ZeroDivide but it should not be an instance of ZeroDivide.

```Smalltalk
[1/0] should raise: Error.
```

It fails with message: Got ZeroDivide but it should be an instance of Error.

```Smalltalk
[1/0] should raise: (Kind of: Error).
```

It not fails because ZeroDevide is kind of Error class.

You can use instance of expected exception instead of class:

```Smalltalk
errorInstance := Error new messageText: 'test error'.
[error signal] should raise: errorInstance
```

It not fails.

```Smalltalk
[self error: 'another error'] should raise: errorInstance
```

It fails with message: Got "Error: another error" but it should equal "Error: test error".


Also there is simple message *#fail* to expect general failure:

```Smalltalk
[1/0] should fail.
```

It not fails beause block is really failed as expected.

```Smalltalk
[1/0] should not fail.
```

It fails with message: Got ZeroDivide but it should not be a kind of Error.

```Smalltalk
[1+2] should fail.
```

It fails with message: Got no failures but should be a kind of Error.

### Predicate syntax
@predicate

In many cases only thing which we want to specify is some boolean state of objects using their own methods.
For this porpose special SpecOfBooleanProperty specification is implemented which should be created with given boolean message:

```Smalltalk
spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)
spec validate: #()
```

Message can includes arguments:

```Smalltalk
spec := SpecOfBooleanProperty fromMessage: (Message selector: #between:and: arguments: #(1 10))
spec validate: 5
```

To use this spec from should expression special *#be* message is introduced. Any following expression after #be will create message for boolean spec as in example above. And then it will validate #should receiver:

```Smalltalk
3 should be even.
2 should not be even.
```

Last expression fails with message: 2 should not be even. Predicate expressions are always report problem as they were written.

Other examples:

```Smalltalk
3 should be between: 10 and: 50.
2 should not between: 1 and: 5.

#(1 2) should be isEmpty.
#() should not be isEmpty.
```

### Validation object properties

Last interesting feature of StateSpecs is ability to validate particular property of object without loosing property itself.
Imaging that we want to validate x coordinate of rectangle origin. It could be done like this:

```Smalltalk
(1@3 corner: 20@1) origin x should equal: 100
```

It fails with message: Got 1 but it should equal 100. But it has no information about what exact property of rectangle is wrong. Users would like to see it in failure message.

To achieve this goal StateSpecs introduced *#where* message which should be sent to receiver and all following messages up to *#should* will be recorded as object propety. At the end #should expression will validate retrieved property instead of receiver:

```Smalltalk
(1@3 corner: 20@30) where origin x should equal: 100.
```

It fails with message: Got 1 from (1@1) corner: (20@3) origin x but it should equal 100.
