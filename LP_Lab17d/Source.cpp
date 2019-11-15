#include <cstdlib>

extern "C" {

	int getmin(int* arrayPointer, int n) {
		int result = arrayPointer[0];
		for (int i = 0; i < n; i++) {
			if (result > arrayPointer[i]) {
				result = arrayPointer[i];
			}
		}
		return result;
	}

	int getmax(int* arrayPointer, int n) {
		int result = arrayPointer[0];
		for (int i = 0; i < n; i++) {
			if (result < arrayPointer[i]) {
				result = arrayPointer[i];
			}
		}
		return result;
	}

}