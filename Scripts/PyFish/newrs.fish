function newc --argument name
    if not count $argv >/dev/null
        return 1
    end

    # INITIAL SETUP
    cargo new $name

    cd $name
    mkdir examples tests .cargo

    # BASIC CARGO STRUCTURE
    echo '[package]
name = "dummy"
version = "0.1.0"
edition = "2021"

[lib]
path = "src/lib.rs"

[[bin]]
path = "src/main.rs"

[dependencies]' >Cargo.toml

    echo '[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=lld"]' >.cargo/config.toml

    echo 'use $name::funk;

fn main() {
        println!("Result {}", funk());
}' >src/main.rs

    echo 'pub fn funk() -> i32 {
        100
}' >src/lib.rs

    echo 'extern crate $name
fn main() {
        println!("Result {}", funk());
}' >examples/basic.rs

    echo '#[test]
fn funk_is100() {
        assert_eq!(100, funk());
}' >tests/funk_is100.rs

    echo "To start development workflow"
    echo "      `cargo watch -x check -x test -x run`"
    echo "To run a single test"
    echo "      `cargo run --example basic`"
end
