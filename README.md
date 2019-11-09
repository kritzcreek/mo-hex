## The Hex Package

[![Build Status](https://travis-ci.org/enzoh/mo-hex.svg?branch=master)](https://travis-ci.org/enzoh/mo-hex?branch=master)

### Overview

This package implements hexadecimal encoding and decoding routines for the
Motoko programming language.

### Usage

Encode a list of unsigned 8-bit integers in hexadecimal format.
```swift
public func encode(list : List<Word8>) : Text
```

Decode a list of unsigned 8-bit integers in hexadecimal format.
```swift
public func decode(text : Text) : Result<List<Word8>, DecodeError>
```
