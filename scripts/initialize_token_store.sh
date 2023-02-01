#!/bin/bash

x=()
i=0
while read line || [ -n "$line" ] ; do
  value=`echo $line | cut -d '=' -f2`
  x[i]=$value
  ((i+=1))
done < scripts/init.config

echo 'start init opt-in by using below information'
for i in "${x[@]}"
do
  echo $i
done

echo yes | aptos move run --funtion-id ${x[1]}::soulbound_token::opt_in_direct_transfer --args bool:true --profile ${x[0]}

#aptos move run --function-id 0x4db6ad0d54fca820d9f81f63b2859c4a7bd067fbe9b65c5f79be715c9694d323::soulbound_token::opt_in_direct_transfer --args bool:true --profile myown

