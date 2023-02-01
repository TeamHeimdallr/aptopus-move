#!/bin/bash

x=()
i=0
while read line || [ -n "$line" ] ; do
  value=`echo $line | cut -d '=' -f2`
  x[i]=$value
  ((i+=1))
done < scripts/collection.config

echo 'start creation collection by using below information'
for i in "${x[@]}"
do
  echo $i
done

# mutate: description, uri, maximum
echo yes | aptos move run --function-id ${x[1]}::soulbound_token::create_collection_script --args string:"${x[2]}" string:"${x[3]}" string:"${x[4]}" u64:1000000 vector\<bool\>:true,true,true --profile ${x[0]}

#aptos move run --function-id 0x4db6ad0d54fca820d9f81f63b2859c4a7bd067fbe9b65c5f79be715c9694d323::soulbound_token::create_collection_script --args string:"AptopusCollectionTest" string:"This Is Description!" string:"ipfs://metadataCID" u64:100000 vector\<bool\>:false,false,false
