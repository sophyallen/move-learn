module zmc::basis_test {
    use zmc::basis;
    #[test]
    public fun basis_types_test() {
        basis::basis_types();
        assert!(true, 1)
    }

    #[test(account = @0x02)]
    public fun advance_types_test(account: signer) {
        let user = basis::advance_types(account);
        assert!(basis::get_gender(&user), 1)
    }

    #[test]
    public fun check_equal_test() {
        let rs = basis::check_equal(8u8, 8u8);
        assert!(rs, 1);
        let a = 8u8;
        let b = 8u64;
        rs = basis::check_equal(a, (b as u8));
        assert!(rs, 1);
        rs = basis::check_equal(a, ((b-1) as u8));
        assert!(!rs, 1);
    }

    #[test]
    #[expected_failure(abort_code = 1)]
    public fun abort_test() {
        abort 1
    }
}