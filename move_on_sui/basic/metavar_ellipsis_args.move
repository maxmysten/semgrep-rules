
module 0xcafe::metavar_ellipsis_args {
    fun test_metavar_ellipsis_args() {
      // ruleid: meta_fun_test
        foo(1, 2, 3, 1, 2);
        foo(1, 2, 3, 4, 5);
    }
}
