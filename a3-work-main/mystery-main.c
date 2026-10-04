/* Complete the C version of the driver program for mystery. This C code does
 * not need to compile. */

#include <stdio.h>
#include <stdlib.h>

extern long crunch(long, long);

int main(int argc, char *argv[]) {
  if (argc != 3) {
    puts("Two arguments required.");
    return 1;
  }

  long first  = atol(argv[1]);
  long second = atol(argv[2]);

  long result = crunch(first, second);

  if (result < 0) {
    puts("hat");
  } else if (result == 0) {
    puts("tea");
  } else {
    puts("beer");
  }
  return 0;
}

