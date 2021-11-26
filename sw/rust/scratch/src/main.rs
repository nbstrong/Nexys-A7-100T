#![feature(int_log)]

fn main() {

    for n in 0..32 {
        println!("2^{1:0>2} : {0:#010} : {0:#010x} : {0:#034b}", 2u32.pow(n), 2u32.pow(n).log2());
    }
}
