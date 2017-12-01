#include <stdio.h>

int fib(int m) {
    if (m == 0) return 0;
    if (m == 1) return 1;
    return fib(m - 1) + fib(m - 2);
}

int main() {
    printf("%d", fib(42));
    return 0;
}
