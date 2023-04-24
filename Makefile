RISCV ?= /opt/riscv
CROSS_COMPILE ?= riscv64-unknown-linux-gnu-
INITRAMFS_ROOT := $(shell pwd)

export RISCV
export CROSS_COMPILE
export INITRAMFS_ROOT

INITRAMFS_TXT := initramfs.txt

APPS := busybox
APPS-CLEAN := $(foreach app,$(APPS),$(app)-clean)

.PHONY: all clean $(APPS) $(APPS-CLEAN)

all: $(INITRAMFS_TXT)

$(INITRAMFS_TXT): $(APPS)
	./scripts/gen-initramfs-list.sh $@

clean: $(APPS-CLEAN)
	rm -f $(INITRAMFS_TXT)

$(APPS): %: $(INITRAMFS_PATH)
	$(MAKE) -C apps/scripts/$* all

$(APPS-CLEAN): %-clean:
	$(MAKE) -C apps/scripts/$* clean

$(INITRAMFS_PATH):
	mkdir -p $(INITRAMFS_PATH)
