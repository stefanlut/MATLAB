#include <iostream>
#include "FileFunctions.h"
#include "Statistics.h"
using namespace std;


int * DoubleAndReverse(const int *list,int &size)
{
    
    int *res = new int[size]; 
    
    for(int i = 0; i < size; i++)
    {
        res[i] = *(list + i);
        
    }
    for(int i = 0; i < size ; i++)
    {
        res[i+size] = *(list + (size - i - 1));
    }
    size *= 2;
    return res;
}
int main()
{
    char filename[10] = {'d','a','t','a','.','t','x','t','\0'};
    int size;
    int myArray[32];
    
    cout << "Writing file: " << filename << endl;
    WriteRandomData(10, 1000,filename);

    cout << "Reading file: " << filename << endl;
    ReadData(filename,size,myArray);
    cout << "Array size is " << size << endl;
    
    cout << "Double and reversed is [";
    int *newArray = DoubleAndReverse(myArray, size);
   
    for(int i = 0; i < size; i++)
    {
        cout << " " << *(newArray + i);
    }
    cout << ']' << endl;
    cout << "Median is: " << getMedian(newArray,size) << endl;
    cout << "Largest is: " << getLargest(newArray,size) << endl;
    return 0;
}