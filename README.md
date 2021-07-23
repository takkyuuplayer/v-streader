# v-streader

![CI](https://github.com/takkyuuplayer/v-streader/workflows/CI/badge.svg)

Port of Go's strings.Reader

```v
import takkyuuplayer.streader
import os
import io

fn main() {
	mut reader := streader.new('hello world')
	mut out := os.stdout()
	io.cp(reader, mut out) ? // Output: hello world
}
```
