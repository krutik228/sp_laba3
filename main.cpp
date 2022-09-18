#include <iostream>

using namespace std;

extern "C" int calc_word(char* line, int* array);

int main()
{
	int len_word[100];

	string line = "he ll o";
	cout << "Line: " << line << endl;
	cout << "=======================" << endl;

	int* ptr_len_word = &len_word[0];
  char* ptr_line = &line[0];

	int count_word = calc_word(ptr_line, ptr_len_word);

	for (int i = 0; i < 100; i++)
	{
		if (len_word[i] == 0)
			break;

		cout << "Len word #" << i + 1 << ": " << len_word[i] << endl;
	}

	cout << "------------------------" << endl;

	cout << "Count word: " << count_word << endl;
}

