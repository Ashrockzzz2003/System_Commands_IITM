iarray=(1 2 3 4 5);
unset iarray[2];
echo ${iarray[@]:1};
