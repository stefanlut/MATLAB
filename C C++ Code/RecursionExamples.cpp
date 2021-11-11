#include <iostream>

using namespace std;

int factorial(int n)
{
	if(n == 0) // base case
	{
		return 1;
	}
	else return n * factorial(n-1);
}
int fibonacci(int n)
{
	if(n <= 1) // base case
	{
		return n;
	
	}
	return fibonacci(n - 1) + fibonacci(n - 2);
}
int main()
{
	int n;
	cout << "Enter a number: ";
	cin >> n;

	cout << n << "! = " << factorial(n) << endl;

	cout << n <<"th element is: " << fibonacci(n) << endl;


	return 0;
}
