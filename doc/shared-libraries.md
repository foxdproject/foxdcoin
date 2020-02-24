Shared Libraries
================

## foxdcoinconsensus

The purpose of this library is to make the verification functionality that is critical to Foxdcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `foxdcoinconsensus.h` located in  `src/script/foxdcoinconsensus.h`.

#### Version

`foxdcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`foxdcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `foxdcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/foxdcoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/foxdcoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/foxdcoin/bips/blob/master/bip-0147.mediawiki))
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/foxdcoin/bips/blob/master/bip-0065.mediawiki))
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/foxdcoin/bips/blob/master/bip-0112.mediawiki))
- `foxdcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/foxdcoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `foxdcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `foxdcoinconsensus_verify_script` for the verification status)*
- `foxdcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `foxdcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `foxdcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `foxdcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NFoxdcoin](https://github.com/NicolasDorier/NFoxdcoin/blob/master/NFoxdcoin/Script.cs#L814) (.NET Bindings)
- [node-libfoxdcoinconsensus](https://github.com/bitpay/node-libfoxdcoinconsensus) (Node.js Bindings)
- [java-libfoxdcoinconsensus](https://github.com/dexX7/java-libfoxdcoinconsensus) (Java Bindings)
- [foxdcoinconsensus-php](https://github.com/Bit-Wasp/foxdcoinconsensus-php) (PHP Bindings)
