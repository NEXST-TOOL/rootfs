RISCV ?= /opt/riscv
CROSS_COMPILE ?= riscv64-unknown-linux-gnu-

INITRD_PATH := $(shell pwd)/initrd

export CROSS_COMPILE
export INITRD_PATH

APPS := busybox
APPS-CLEAN := $(foreach app,$(APPS),$(app)-clean)

.PHONY: all clean $(APPS) $(APPS-CLEAN)

all: $(APPS)

clean: $(APPS-CLEAN)
	rm -rf $(INITRD_PATH)

$(APPS): %: $(INITRD_PATH)
	$(MAKE) -C apps/scripts/$* all

$(APPS-CLEAN): %-clean:
	$(MAKE) -C apps/scripts/$* clean

$(INITRD_PATH):
	mkdir -p $(INITRD_PATH)
