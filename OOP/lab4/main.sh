make -Csrc clean
make -B -Csrc
./main <0.in >0.out
diff out 0.out
if [ $? -ne 0 ]; then
    echo "0" > $1
else
    echo "100" > $1
fi
