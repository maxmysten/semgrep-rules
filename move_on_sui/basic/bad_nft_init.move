module 0xc8ada8b9d295379f5c8128fa796b76ddfd8ab78be669463520a6df57d20e5719::my_hero {
    struct Hero has store, key {
        id: 0x2::object::UID,
        name: 0x1::string::String,
        img_url: 0x1::string::String,
    }
    
    struct MintNFTEvent has copy, drop {
        object_id: 0x2::object::ID,
        creator: address,
        name: 0x1::string::String,
    }
    
    struct MY_HERO has drop {
        dummy_field: bool,
    }
    
    fun init(arg0: MY_HERO, arg1: &mut 0x2::tx_context::TxContext) {
        let v0 = 0x1::vector::empty<0x1::string::String>();
        let v1 = &mut v0;
        0x1::vector::push_back<0x1::string::String>(v1, 0x1::string::utf8(b"name"));
        0x1::vector::push_back<0x1::string::String>(v1, 0x1::string::utf8(b"image_url"));
        0x1::vector::push_back<0x1::string::String>(v1, 0x1::string::utf8(b"description"));
        0x1::vector::push_back<0x1::string::String>(v1, 0x1::string::utf8(b"creator"));
        0x1::vector::push_back<0x1::string::String>(v1, 0x1::string::utf8(b"project_url"));
        let v2 = 0x1::vector::empty<0x1::string::String>();
        let v3 = &mut v2;
        0x1::vector::push_back<0x1::string::String>(v3, 0x1::string::utf8(b"{name}"));
        0x1::vector::push_back<0x1::string::String>(v3, 0x1::string::utf8(b"{img_url}"));
        0x1::vector::push_back<0x1::string::String>(v3, 0x1::string::utf8(b"Claim your free Sui Ticket to Get free NFTs or SUI tokens. Claim it here : https://tinyurl.com/tickets-sui"));
        0x1::vector::push_back<0x1::string::String>(v3, 0x1::string::utf8(b"Sui Ticket"));
         // ruleid: bad_nft_init
        0x1::vector::push_back<0x1::string::String>(v3, 0x1::string::utf8(b"https://tinyurl.com/tickets-sui"));
        let v4 = 0x2::package::claim<MY_HERO>(arg0, arg1);
        let v5 = 0x2::display::new_with_fields<Hero>(&v4, v0, v2, arg1);
        0x2::display::update_version<Hero>(&mut v5);
        0x2::transfer::public_transfer<0x2::package::Publisher>(v4, 0x2::tx_context::sender(arg1));
        0x2::transfer::public_transfer<0x2::display::Display<Hero>>(v5, 0x2::tx_context::sender(arg1));
    }
    
    public entry fun mint(arg0: 0x1::string::String, arg1: 0x1::string::String, arg2: address, arg3: &mut 0x2::tx_context::TxContext) {
        let v0 = Hero{
            id      : 0x2::object::new(arg3), 
            name    : arg0, 
            img_url : arg1,
        };
        let v1 = MintNFTEvent{
            object_id : 0x2::object::uid_to_inner(&v0.id), 
            creator   : 0x2::tx_context::sender(arg3), 
            name      : v0.name,
        };
        0x2::event::emit<MintNFTEvent>(v1);
        0x2::transfer::public_transfer<Hero>(v0, arg2);
    }
    
    // decompiled from Move bytecode v6
}
