module streader

// A Reader implements the io.Reader
struct Reader {
	s []byte
mut:
	i i64
}

// len returns the number of bytes of the unread portion of the
// string.
pub fn (mut r Reader) len() int {
	if r.i >= i64(r.s.len) {
		return 0
	}
	return int(i64(r.s.len) - r.i)
}

// size returns the original length of the underlying string.
// The returned value is always the same and is not affected by calls
// to any other method.
pub fn (mut r Reader) size() int {
	return int(i64(r.s.len))
}

// read implements the io.Reader interface.
pub fn (mut r Reader) read(mut buf []byte) ?int {
	if r.i >= i64(r.s.len) {
		return none
	}
	n := copy(buf, r.s[r.i..])
	r.i += n
	return n
}

// reset resets the Reader to be reading from s.
pub fn (mut r Reader) reset() {
	r = Reader{r.s, 0}
}

// new returns a new Reader reading from s.
pub fn new(s string) Reader {
	return Reader{s.bytes(), 0}
}
