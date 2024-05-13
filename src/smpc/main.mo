// import List "mo:base/List";
// import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";
// import Text "mo:base/Text";
// import Nat32 "mo:base/Nat32";
// import Char "mo:base/Char";
// import Hash "mo:base/Hash";
// import Array "mo:base/Array";
// // import Crypto "mo:base/Crypto";
// actor Smpc {
//   // type Participant = {
//   //   address : Text;
//   //   secretShare : Hash;
//   // };

//   // // Define a map to store participants
//   // var participants : Map.Text<Participant> = HashMap.create();
//   // var count : Nat = 2;
//   // public func getCount() : async Nat {
//   //   return count;
//   // };

//   // // Function for participants to submit their secret shares
//   // public func submitSecretShare(address : Text, secretShare : Hash) : async () {
//   //   participants[address] := { address = address; secretShare = secretShare };
//   // };

//   // // // Function to compute hash collaboratively
//   // // public func computeHash() : async Hash {
//   // //   var result : Hash := 0;
//   // //   for (participant in Map.values(participants)) {
//   // //     result := result ^ participant.secretShare;
//   // //   };
//   // //   return result;
//   // // };



  

//     var hashValues : List.List<Text> = List.nil<Text>();

//     public func submitHashValue(hashValue: Text) {
//         hashValues := List.push(hashValue, hashValues);
//     };

//     public func getHashValueCount() : async Nat {
//         return List.size(hashValues);
//     };

//     public func getHashValues(): async [Text]{
//       return List.toArray(hashValues);
//     };
    
//     public func computeHash(): async Nat {
//         let concatenatedHashes = List.foldLeft<Text, Text>(hashValues, "", Text.append);
//         let hashedValue = hash(concatenatedHashes);
//         return hashedValue;
//     };

//    private func hash(input: Text): Nat {
//     var result: Nat = 0;
//     let inputArray = Text.toArray(input);
//     let asciiValues = Array.map<Char, Nat>(inputArray, Char.toNat);
//     for (asciiValue in asciiValues.vals()) {
//         result := (result * 31 + asciiValue) % Nat.pow(2, 32);
//     };
//     return result;
// };



    




//     //  public func computeSHA256(): async Text {
//     //     let concatenatedHashes = List.foldLeft<Text, Text>(hashValues, "", Text.append);
//     //     return Crypto.sha256(concatenatedHashes);
//     // };

// //     public func hashList(hashValues: List.List<Text>): async Text {
// //   let concatenatedHashes = List.foldLeft<Text, Text>(hashValues, "", Text.append);
// //   let hashedValue = Sha256.hash(concatenatedHashes);
// //   return hashedValue;
// // };

//     // public func computeSHA256(hashValues: [Text]) : Text {
//     //     let concatenatedHashes = List.foldLeft(
//     //         concatenateHashes,
//     //         "",
//     //         hashValues
//     //     );
//     //     return Crypto.sha256(concatenatedHashes);
//     // };



// };
import List "mo:base/List";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Hash "mo:base/Hash";
import Array "mo:base/Array";

actor Smpc {
    var hashValues : List.List<Text> = List.nil<Text>();
    var count: Nat = 1;
    public func submitHashValue(hashValue: Text) {
        hashValues := List.push(hashValue, hashValues);
    };

    public func getHashValueCount() : async Nat {
        return List.size(hashValues);
    };

    public func getHashValues(): async [Text]{
      return List.toArray(hashValues);
    };
    
    public func computeHash(): async Nat32 {
        let concatenatedHashes = List.foldLeft<Text, Text>(hashValues, "", Text.concat);
        let hashedValue = Text.hash(concatenatedHashes);
        return hashedValue;
    };

  //  private func hash(input: Text): Nat {
  //   var result: Nat = 0;
  //   let inputArray = Text.toArray(input);
  //   let asciiValues = Array.map<Char, Nat32>(inputArray, Char.toNat32);
  //   for (asciiValue in asciiValues.vals()) {
  //       result := (result * 31 + Nat32.toNat(asciiValue)) % Nat.pow(2, 32);
  //   };
  //   return result;
  // };
};

