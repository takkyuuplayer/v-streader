module streader

fn test_read() ? {
	mut reader := new('abcde')
	mut bw := []u8{len: 3}

	n0 := reader.read(mut bw) ?
	assert n0 == 3

	n1 := reader.read(mut bw) ?
	assert n1 == 2

	if _ := reader.read(mut bw) {
		assert false
	} else {
		assert err is none
	}
}

fn test_len() ? {
	mut reader := new('abcde')
	mut bw := []u8{len: 3}

	assert reader.len() == 5

	_ := reader.read(mut bw) ?
	assert reader.len() == 2

	_ := reader.read(mut bw) ?
	assert reader.len() == 0
}

fn test_size() ? {
	mut reader := new('abcde')
	mut bw := []u8{len: 3}

	assert reader.size() == 5

	_ := reader.read(mut bw) ?
	assert reader.size() == 5
}
