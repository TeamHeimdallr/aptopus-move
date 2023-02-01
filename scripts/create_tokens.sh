#!/bin/bash

x=()
i=0
while read line || [ -n "$line" ] ; do
  value=`echo $line | cut -d '=' -f2`
  x[i]=$value
  ((i+=1))
done < scripts/tokens.config

echo 'start creation token by using below information'
for i in "${x[@]}"
do
  echo $i
done

# mutate: max, uri, royaltiy, description, properties
echo yes | aptos move run --function-id ${x[1]}::soulbound_token::create_soulbound_token_script --args address:${x[2]} string:"${x[3]}" string:"${x[4]}" string:"${x[5]}" u64:1 u64:1 string:"${x[6]}" address:${x[1]} u64:0 u64:0 vector\<bool\>:false,true,false,true,true raw:${x[7]} raw:${x[8]} raw:${x[9]} --profile ${x[0]}

#aptos move run --function-id 0x4db6ad0d54fca820d9f81f63b2859c4a7bd067fbe9b65c5f79be715c9694d323::soulbound_token::create_soulbound_token_script --args address:0xc6a8b596895b63cad099c82707211c92abc73d57f777a77e17c61d4a91ba2af2 string:"AptopusCollectionTest" string:"aptopustest #1" string:"token description!" u64:1 u64:1 string:"ipfs://QmcQCbRcorXDnhBhXCZGdZWzuJbCtWKdSCKsHCLjqUS7xM" address:0x4db6ad0d54fca820d9f81f63b2859c4a7bd067fbe9b65c5f79be715c9694d323 u64:0 u64:0 vector\<bool\>:false,false,false,false,false raw:00 raw:00 raw:00
