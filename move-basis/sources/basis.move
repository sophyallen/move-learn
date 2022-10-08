#[test_only]
module zmc::basis {
    use std::signer;
    use std::string;

    // define a User struct
    struct User has drop{
        id: u64,
        name: string::String,
        scores: vector<u8>,
        gender: bool
    }

    public fun get_gender(user: &User): bool {
        user.gender
    }

    public fun basis_types() {
        // num
        let a = 8u8;
        a = a+2;
        let b: u64 = 1024;
        let c: u128;
        c = (a as u128) * (b as u128);
        let _ = c;
        // boolean
        let bl = true;
        let _ = bl;
    }

    public fun advance_types(account: signer): User {
        let user: User = User{
            id: 1,
            name: string::utf8(b"zmc"),
            scores: vector[60, 70, 80], 
            gender: true
        };
        // debug::print(&user);
        let adr: address = signer::address_of(&account);
        let adr2 = @std;
        let _ = adr;
        let _ = adr2;
        return user
    }

    public fun new_user(id: u64, name: string::String, scores: vector<u8>, gender: bool): User {
        User{
            id, name, scores, gender
        }
    }

    public fun check_equal<T: drop>(arg1: T, arg2: T): bool {
        arg1 == arg2
    }

}