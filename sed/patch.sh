#!/bin/bash

if [[ -e sed/all.sed ]] ; then 
    sed -i -f sed/all.sed .gen/*.ads
fi

for sedfile in sed/*.sed ; do
    srcfile=.gen/$(basename ${sedfile} .sed).ads
    if [[ -e ${srcfile} ]] ; then
		sed -i -f ${sedfile} ${srcfile}
    fi
done

