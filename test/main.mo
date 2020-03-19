import Codec "../src/hex";
import List "mo:stdlib/list";
import Nat "mo:stdlib/nat";
import Option "mo:stdlib/option";
import Prim "mo:prim";
import Result "mo:stdlib/result";

type List<T> = List.List<T>;

actor Test {

  func toBytes(ascii : Text) : List<Word8> {
    let get = ascii.chars().next;
    List.tabulate<Word8>(ascii.len(), func (_) {
      Nat.toWord8(Nat.fromWord32(Prim.charToWord32(Option.unwrap<Char>(get()))))
    })
  };

  public func test() {
    let expect = toBytes("Hello World");
    let actual = Result.assertUnwrap<List<Word8>, Codec.Hex.DecodeError>(
      Codec.Hex.decode(Codec.Hex.encode(expect))
    );
    assert(List.isEq<Word8>(expect, actual, func (a, b) { a == b }))
  }

}
