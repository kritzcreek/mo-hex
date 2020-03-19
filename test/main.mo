import Hex "../src/hex";
import List "mo:stdlib/list";
import Option "mo:stdlib/option";
import Result "mo:stdlib/result";
import Prim "mo:prim";

type List<T> = List.List<T>;

actor Test {

  func toBytes(ascii : Text) : List<Word8> {
    let get = ascii.chars().next;
    List.tabulate<Word8>(ascii.len(), func (_) {
      Prim.natToWord8(Prim.word32ToNat(Prim.charToWord32(Option.unwrap<Char>(get()))))
    })
  };

  public func test() {
    let expect = toBytes("Hello World");
    let actual = Result.assertUnwrap<List<Word8>, Hex.DecodeError>(
      Hex.decode(Hex.encode(expect))
    );
    assert(List.isEq<Word8>(expect, actual, func (a, b) { a == b }))
  }

}
