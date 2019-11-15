#include <iostream>
using namespace std;
extern "C"
{
	int __stdcall getmax(int *parray, int count);
	int __stdcall getmin(int *parray, int count);
};
int main()
{
	int array[10] = { -3, 31, 2, 4, -10, 6, -11, 8, 20, 0 };
	int max = getmax(array, 10);
	int min = getmin(array, 10);
	cout << "max - min = " << max - min << endl;
	system("pause");
}