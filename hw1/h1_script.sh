#!/bin/bash

clear
echo "Running the first experiment for cpu with prime number parameter = 2000"
for iter in 1 2 3 4 5
do
	sysbench --test=cpu --cpu-max-prime=2000 run >> testcase_1_results
done

echo "Finished running first experiment. Results stored in testcase_1_results file"

echo "\n\n"

echo "Running the second experiment for cpu with prime number parameter = 20000 and time = 150 seconds"
for iter in 1 2 3 4 5
do
	sysbench --test=cpu --cpu-max-prime=20000 --time=150 run >> testcase_2_results
done

echo "Finished running second experiment. Results stored in testcase_2_results file"

echo "\n\n"

echo "Running the third experiment for file i/o with file-test-mode set to rndrw"
for iter in 1 2 3 4 5
do
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw prepare
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw run >> testcase_3_results
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw cleanup
	sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
	sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
	sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
done

echo "Finished running third experiment. Results stored in testcase_3_results file"
echo "\n\n"

echo "Running the fourth experiment for file i/o with file-io-mode flag set to async"
for iter in 1 2 3 4 5
do
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw --file-io-mode=async prepare
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw --file-io-mode=async run >> testcase_4_results
	sysbench --num-threads=16 --test=fileio --file-total-size=100M --file-test-mode=rndrw --file-io-mode=async cleanup
	sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
	sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
	sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
done

echo "Finished running fourth experiment. Results stored in testcase_4_results file"
echo "\n\n"


