double getMedian(const int* array, const int size)
{
    double medianNum;
    if(size % 2 == 0) // if array has even amount of elements
    {
        medianNum = (array[(size-1)/2] + array[size/2])/2.0;
    }
    else // if array has odd amount of elements (unlikely as this is using the doubled array size)
    {
        medianNum = array[size/2];
    }
    return medianNum;
}
int getLargest(const int* array, const int size)
{
    int largestNum = 0;
    for(int i = 0; i < size; i++)
    {
        if(array[i] > largestNum)
            largestNum = array[i];
    }
    return largestNum;
}