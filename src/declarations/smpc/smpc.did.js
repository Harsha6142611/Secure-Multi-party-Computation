export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'computeHash' : IDL.Func([], [IDL.Nat32], []),
    'getHashValueCount' : IDL.Func([], [IDL.Nat], []),
    'getHashValues' : IDL.Func([], [IDL.Vec(IDL.Text)], []),
    'submitHashValue' : IDL.Func([IDL.Text], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
