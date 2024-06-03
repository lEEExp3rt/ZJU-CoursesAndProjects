make clean
make -B
echo "2021-01-01:Happy New Year" > personal_dairy.txt
echo "2021-01-02:Happy New Year 2" >> personal_dairy.txt
./pdadd 2024-02-29 <in >out
./pdlist >>out
./pdshow 2021-01-01 >>out
./pdshow 2022-02-01 >>out
./pdremove 2021-01-02 >>out
echo $? >>out
./pdremove 2022-01-02 >>out
echo $? >>out
./pdlist >>out
diff out std_out
if [ $? -ne 0 ]; then
    echo "0" > $1
else
    echo "100" > $1
fi
make clean
