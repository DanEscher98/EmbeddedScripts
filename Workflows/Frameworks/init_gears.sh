#!/usr/bin/bash

# An script to automate the creation of smart contracts using Vara/Gear

# .
# ├── io /                  // function for input/output
# │   ├── src /
# │   │   └── lib.rs
# │   └── Cargo.toml
# ├── src/                  // the smart-contract code
# │   ├── contract.rs
# │   └── lib.rs
# ├── state/                // to read the state
# │   ├── src/
# │   │   ├── lib.rs
# │   │   └── state.rs
# │   ├── Cargo.toml
# │   └── build.rs
# ├── tests/
# │   ├── gclient_test.rs
# │   └── test.rs
# ├── Cargo.toml
# ├── Makefile
# ├── meta.txt
# └── build.rs

contract_name="demo_ping"
struct_name="DemoPing"
rev_hash="946ac47"
authors="Gears Technology"

cargo new --lib "$contract_name" && cd "$contract_name"
cargo new --lib "io"
cargo new --lib "state"
mkdir tests

echo '[package]
name = "'$contract_name'"
version.workspace = true
authors.workspace = true
edition.workspace = true
license.workspace = true

[dependencies]
gstd.workspace = true

[dev-dependencies]
gtest.workspace = true

[build-dependencies]
'$contract_name'_io.workspace = true
gear-wasm-builder.workspace = true

[features]
binary-vendor = []

[workspace]
members = ["state"]

[workspace.package]
version = "0.1.1"
edition = "2021"
license = "MIT"
authors = ["'"$authors"'"]

[workspace.dependencies]
gstd = { git = "https://github.com/gear-tech/gear.git", rev = "'$rev_hash'" }
gtest = { git = "https://github.com/gear-tech/gear", rev = "'$rev_hash'" }
gmeta = { git = "https://github.com/gear-tech/gear", rev = "'$rev_hash'" }
gear-wasm-builder = { git = "https://github.com/gear-tech/gear", rev = "'$rev_hash'" }
'$contract_name'_io = { path = "io" }' > Cargo.toml

echo 'fn main() {
    gear_wasm_builder::build_with_metadata::<demo_ping_io::DemoPingMetadata>();
}' >build.rs

echo '[toolchain]
channel = "nightly-2023-04-25"
targets = ["wasm32-unknown-unknown"]
profile = "default"' >rust-toolchain.toml

echo '#![no_std]

#[cfg(not(feature = "binary-vendor"))]
mod contract;

// See `Cargo.toml` for the description of the "binary-vendor" feature.
#[cfg(feature = "binary-vendor")]
include!(concat!(env!("OUT_DIR"), "/wasm_binary.rs"));' >src/lib.rs

echo 'use gstd::{debug, msg, prelude::*};

static mut MESSAGE_LOG: Vec<String> = vec![];

#[no_mangle]
extern "C" fn handle() {
    let new_msg: String = msg::load().expect("Unable to create string");

    if new_msg == "PING" {
        msg::reply_bytes("PONG", 0).expect("Unable to reply");
    }

    unsafe {
        MESSAGE_LOG.push(new_msg);

        debug!("{:?} total message(s) stored: ", MESSAGE_LOG.len());

        for log in &MESSAGE_LOG {
            debug!("{log:?}");
        }
    }
}

#[no_mangle]
extern "C" fn state() {
    msg::reply(unsafe { MESSAGE_LOG.clone() }, 0)
        .expect("Failed to encode or reply with `<AppMetadata as Metadata>::State` from `state()`");
}

#[cfg(test)]
mod tests {
    extern crate std;

    use gstd::{Encode, String};
    use gtest::{Log, Program, System};

    #[test]
    fn it_works() {
        let system = System::new();
        system.init_logger();

        let program = Program::current(&system);

        let res = program.send_bytes(42, "INIT");
        assert!(!res.main_failed());

        let res = program.send_bytes(42, String::from("PING").encode());
        let log = Log::builder().source(1).dest(42).payload_bytes("PONG");
        assert!(res.contains(&log));
    }
}' >src/contract.rs

echo '[package]
name = "'$contract_name'-state"
version.workspace = true
authors.workspace = true
edition.workspace = true
license.workspace = true

[dependencies]
gstd.workspace = true
gmeta = { workspace = true, features = ["codegen"] }
'$contract_name'_io.workspace = true

[build-dependencies]
gear-wasm-builder = { workspace = true, features = ["metawasm"] }' > state/Cargo.toml

echo 'fn main() {
    gear_wasm_builder::build_metawasm();
}' > state/build.rs

echo '#![no_std]

use '$contract_name'_io::*;
use gmeta::{metawasm, Metadata};
use gstd::prelude::*;

#[metawasm]
pub mod metafns {
pub type State = <'$struct_name'Metadata as Metadata>::State;

    pub fn get_first_message(state: State) -> String {
        state.first().expect("Message log is empty!").to_string()
    }

    pub fn get_last_message(state: State) -> String {
        state.last().expect("Message log is empty!").to_string()
    }

    pub fn get_messages_len(state: State) -> u64 {
        state.len() as u64
    }

    pub fn get_message(state: State, index: u64) -> String {
        state
            .get(index as usize)
            .expect("Invalid index!")
            .to_string()
    }
}' > state/src/lib.rs

echo '[package]
name = "'$contract_name'_io"
version.workspace = true
authors.workspace = true
edition.workspace = true
license.workspace = true

[dependencies]
gmeta.workspace = true
gstd.workspace = true' > io/Cargo.toml

echo '#![no_std]

use gmeta::{InOut, Metadata};
use gstd::prelude::*;

pub struct DemoPingMetadata;

impl Metadata for '$struct_name'Metadata {
    type Init = ();
    type Handle = InOut<String, String>;
    type Others = ();
    type Reply = ();
    type Signal = ();
    type State = Vec<String>;
}' > io/src/lib.rs


