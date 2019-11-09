import Codec "../src/hex.mo";
import List "mo:stdlib/list.mo";
import Option "mo:stdlib/option.mo";
import Result "mo:stdlib/result.mo";

type List<T> = List.List<T>;

actor Test {

  func toBytes(ascii : Text) : List<Word8> {
    let get = ascii.chars().next;
    List.tabulate<Word8>(ascii.len(), func (_) {
      natToWord8(word32ToNat(charToWord32(Option.unwrap<Char>(get()))))
    })
  };

  public func test() {
    let expect = toBytes("Hello World");
    let actual = Result.assertUnwrap<List.List<Word8>, Codec.Hex.DecodeError>(
      Codec.Hex.decode(Codec.Hex.encode(expect))
    );
    assert(List.isEq<Word8>(expect, actual, func (a, b) { a == b }))
  }

}
