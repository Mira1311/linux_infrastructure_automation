#!/bin/bash


## create dummy logs to become the base of automation cron test

for ((i=1; i<=50; i++)) do
	touch dummy_${i}.log
done

