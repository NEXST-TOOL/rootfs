#include "hpmdriver.h"
#include <stdio.h>
#include <stdlib.h>

int set_perf(int csr_num, size_t wdata) {
  return syscall(SET_PERF, csr_num, wdata);
}
int get_perf(int csr_num) { return syscall(GET_PERF, csr_num); }

void basic_test(int csr_num, size_t wdata) {
  size_t get_ret, set_ret = 0;

  get_ret = get_perf(csr_num);
  printf("csr %#x initial value = %#lx\n", csr_num, get_ret);

  set_ret = set_perf(csr_num, wdata);
  get_ret = get_perf(csr_num);
  printf("set syscall ret = %#lx\n", set_ret);
  printf("set csr %#x value to %#lx, read is %#lx\n", csr_num, wdata, get_ret);
}

void payload() {
  uint32_t arr[64];
  for (int i = 0; i < 64; i++) {
    arr[i] = 0xffffffff;
  }
}

void count_test(int csr_num) {
  int set_ret, get_ret;
  set_ret = set_perf(csr_num, 0);
  payload();
  get_ret = get_perf(csr_num);
  printf("perf %#x after payload is %#x\n", csr_num, get_ret);
}

int main() {
  printf("================= Basic Test Begin ===============\n");
  basic_test(0xb03, rand());
  basic_test(0xb04, rand());
  basic_test(0xb05, rand());
  basic_test(0xb06, rand());
  printf("================= Basic Test Finish ===============\n");
  printf("\n");

  hpm_init();
  payload();
  hpm_statistic();

  return 0;
}