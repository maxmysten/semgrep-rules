
module 0xcafe::dots_string {
    fun test_dots_string() {
       // ruleid: move_dots_string
        foo(b"whatever sequence of chars");
       // ruleid: move_dots_string
        foo(b"whatever sequence of chars");
    }
}
