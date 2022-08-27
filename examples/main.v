module main

import examples.streader
import os
import io

fn main() {
	mut reader := streader.new('hello world')
	mut out := os.stdout()
	io.cp(reader, mut out)?
}
