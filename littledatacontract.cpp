#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/asset.hpp>
#include <string>
using namespace eosio;

using std::string;
class littledata : public eosio::contract {
private:
    static const uint64_t symbol = N(EOS);
    bool isnewuser( account_name user ) {
      littletable obj(_self, _self);
      // get object by secondary key
      auto littles = obj.get_index<N(getbyuser)>();
      auto little = littles.find(user);

      return little == littles.end();
    }
     bool userexists( account_name user ) {
      littletable obj(_self, _self);
      // get object by secordary key
      auto littles = obj.get_index<N(getbyuser)>();
      auto little = littles.find(user);

      return little == littles.end();
    }


    /// @abi table
    struct littlestruct {
      uint64_t      prim_key;  // primary key
      account_name  user;      // account name for the user
      std::string   hashdata;      // the hashed data
      uint64_t      timestamp; // the store the last update block time

      // primary key
      auto primary_key() const { return prim_key; }
      // secondary key: user
      account_name get_by_user() const { return user; }
    };

    // create a multi-index table and support secondary key
    typedef eosio::multi_index< N(littlestruct), littlestruct,
      indexed_by< N(getbyuser), const_mem_fun<littlestruct, account_name, &littlestruct::get_by_user> >
      > littletable;

      /// @abi action 
    void get(const account_name _user) {
        littletable obj(_self, _self);
        auto notes = obj.get_index<N(getbyuser)>();
        auto iterator = notes.find(_user);
        eosio_assert(iterator != notes.end(), "Account not found");
        auto currentData = notes.get(_user);
    //print("Key: ", currentData.prim_key);
    }

    /// @abi action
    /*void send_receipt(account_name buyer, std::string message){
      action(
        permission_level{get_self(), N(active)},
        get_self(),
        N(receipt),
        std::make_tuple(buyer, message)
      ).send();
    }*/

  public:
    using contract::contract;

    
    /// @abi action
    void add(const account_name _user, std::string& _hashdata) {
        
        //usernames are actually numbers under the account name
        //require_auth(_user);
       littletable obj(_self, _self);
        auto notes = obj.get_index<N(getbyuser)>();
        auto iterator = notes.find(_user);
        //eosio_assert(iterator != notes.end(), "User not found");
        
        

 obj.emplace( _self, [&]( auto& address ) {
          address.prim_key    = obj.available_primary_key();
          address.user        = _user;
          address.hashdata        = _hashdata;
          address.timestamp   = now();
        });

       
    }

    /// @abi action

     /*void deposit(account_name buyer, account_name seller, eosio::asset quantity, std::string memo) {

      

      balance_table balance(_self, buyer);
      auto hodl_it = balance.find(symbol);

      asset new_balance;
      if(hodl_it != balance.end())
        balance.modify(hodl_it, buyer, [&](auto& row){
            row.funds -= quantity;
            new_balance = row.funds;
        });
      else
        balance.emplace(buyer, [&](auto& row){
            row.funds = quantity;
            new_balance  = row.funds;
        });

      // std::string message = name{buyer}.to_string() + " deposited " + quantity.amount + ", now has a total of " + new_balance;
      send_receipt(buyer, "You deposited some EOS.");
    }
*/

    /// @abi action
    void buydata(account_name _buyer, account_name _seller, uint64_t price) 
    {
        littletable obj(_self, _self);
        auto notes = obj.get_index<N(getbyuser)>();
        /*auto iterator_buyer = notes.find(_buyer);
        eosio_assert(iterator_buyer != notes.end(), "Buyer not found");*/
        auto currentData = notes.get(_seller);
        //print("Key: ", currentData.prim_key);
       
       
            auto iterator_seller = notes.find(_seller);
            eosio_assert(iterator_seller != notes.end(), "Seller not found");
                asset dataPrice = asset(price, string_to_symbol(4, "EOS"));
                print("Price: ", dataPrice);
                action(permission_level{_buyer,N(active)}, N(eosio), N(transfer), make_tuple(_buyer, _seller, dataPrice, std::string(""))).send();
           
    }
    

};

// specify the contract name, and export a public action: update
EOSIO_ABI( littledata,  (add) (buydata))
