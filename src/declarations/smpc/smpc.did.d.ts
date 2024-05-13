import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'computeHash' : () => Promise<number>,
  'getHashValueCount' : () => Promise<bigint>,
  'getHashValues' : () => Promise<Array<string>>,
  'submitHashValue' : (arg_0: string) => Promise<undefined>,
}
