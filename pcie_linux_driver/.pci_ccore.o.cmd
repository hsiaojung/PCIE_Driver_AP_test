cmd_/mnt/work/imx/pcie_linux_driver/pci_ccore.o := aarch64-poky-linux-gcc -Wp,-MD,/mnt/work/imx/pcie_linux_driver/.pci_ccore.o.d  -nostdinc -isystem /opt/fsl-imx-xwayland/4.14-sumo/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/7.3.0/include -I/home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include -I./arch/arm64/include/generated  -I/home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include -I./include -I/home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi -I./include/generated/uapi -include /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kconfig.h  -I/mnt/work/imx/pcie_linux_driver -I/mnt/work/imx/pcie_linux_driver -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -mgeneral-regs-only -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -mpc-relative-literal-loads -mabi=lp64 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init --sysroot=/opt/fsl-imx-xwayland/4.14-sumo/sysroots/aarch64-poky-linux  -DMODULE -mcmodel=large  -DKBUILD_BASENAME='"pci_ccore"'  -DKBUILD_MODNAME='"pci_ccore"' -c -o /mnt/work/imx/pcie_linux_driver/pci_ccore.o /mnt/work/imx/pcie_linux_driver/pci_ccore.c

source_/mnt/work/imx/pcie_linux_driver/pci_ccore.o := /mnt/work/imx/pcie_linux_driver/pci_ccore.c

deps_/mnt/work/imx/pcie_linux_driver/pci_ccore.o := \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/int-ll64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/int-ll64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/bitsperlong.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/posix_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stddef.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/stddef.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/posix_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/posix_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/barrier.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/barrier.h \
    $(wildcard include/config/smp.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/const.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
  /opt/fsl-imx-xwayland/4.14-sumo/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/7.3.0/include/stdarg.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/linkage.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stringify.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/linkage.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/bitops.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/bitops.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/builtin-__ffs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/builtin-ffs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/builtin-__fls.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/builtin-fls.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/ffz.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/fls64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/sched.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/hweight.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/arch_hweight.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/const_hweight.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/lock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/non-atomic.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bitops/le.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/byteorder.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/byteorder/little_endian.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/swab.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/swab.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/byteorder/generic.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/typecheck.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kern_levels.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/kernel.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/sysinfo.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cache.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cputype.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/build_bug.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/compat.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/stat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/stat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/compat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lockdep/crossrelease.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/preempt.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/sched.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/current.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pid.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rculist.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/atomic.h \
    $(wildcard include/config/arm64/lse/atomics.h) \
    $(wildcard include/config/as/lse.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/lse.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/atomic_ll_sc.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cmpxchg.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/bug.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/brk-imm.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/atomic-long.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/irqflags.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/ptrace.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/ptrace.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/hwcap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/hwcap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/ptrace.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/preempt.h \
  arch/arm64/include/generated/asm/preempt.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/preempt.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/thread_info.h \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/restart_block.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/thread_info.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/debug/align/rodata.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
    $(wildcard include/config/arm64/cont/shift.h) \
  arch/arm64/include/generated/asm/sizes.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/sizes.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sizes.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pfn.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/stack_pointer.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/bottom_half.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/string.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
    $(wildcard include/config/foo.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cpucaps.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/insn.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/fpsimd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/hw_breakpoint.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/ssbd.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/jump_label.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/virt.h \
    $(wildcard include/config/arm64/vhe.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/sections.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/sections.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/pgtable/levels.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/bitmap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcutree.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/time64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/time.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  arch/arm64/include/generated/asm/div64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/div64.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/sem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/ipc.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/spinlock_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/spinlock_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rwlock_types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/spinlock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rwlock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/highuid.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rhashtable.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/err.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/errno.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/errno-base.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/errno.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/errno.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/jhash.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/unaligned/packed_struct.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/list_nulls.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/ktime.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/seqlock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/jiffies.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/timex.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/timex.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/param.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/param.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/param.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/timex.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/percpu.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/timecounter.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/timex.h \
  include/generated/timeconst.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/timekeeping.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/osq_lock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/ipcbuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/sembuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/shm.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/page.h \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/personality.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/personality.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/pgtable-types.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/5level-fixup.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/getorder.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/shm.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/shmbuf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/shmparam.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/shmparam.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kcov.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/kcov.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rbtree.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/timerqueue.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/seccomp.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/seccomp.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/unistd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/unistd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/unistd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/unistd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/seccomp.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/unistd.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/resource.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/resource.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/resource.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/latencytop.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sched/prio.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/signal.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/signal.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/signal.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/signal.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/signal-defs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/sigcontext.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/siginfo.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/siginfo.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/magic.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/stat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kmod.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/umh.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/wait.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/wait.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/sparsemem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/notifier.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  arch/arm64/include/generated/asm/rwsem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/rwsem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcu_segcblist.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/srcutree.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/completion.h \
    $(wildcard include/config/lockdep/completions.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/mmzone.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/numa.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/topology.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/topology.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/sysctl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/elf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/elf.h \
  arch/arm64/include/generated/asm/user.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/user.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/elf.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/elf-em.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sysfs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/idr.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kobject_ns.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kref.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rbtree_latch.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/randomize/base.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/wait_bit.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kdev_t.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/kdev_t.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dcache.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rculist_bl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/list_bl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/bit_spinlock.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/path.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/list_lru.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/shrinker.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/hmm.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/auxvec.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/auxvec.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/auxvec.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/uprobes.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/mmu.h \
    $(wildcard include/config/unmap/kernel/at/el0.h) \
    $(wildcard include/config/harden/branch/predictor.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/capability.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/capability.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/semaphore.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/fcntl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/fcntl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/uapi/asm/fcntl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/fcntl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/fiemap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/migrate_mode.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/percpu-rwsem.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcuwait.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/rcu_sync.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/delayed_call.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/uuid.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/uuid.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/errseq.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/fs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/limits.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/ioctl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/asm-generic/ioctl.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/percpu_counter.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/dqblk_xfs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dqblk_v1.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dqblk_v2.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dqblk_qtree.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/projid.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/quota.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/nfs_fs_i.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/range.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/percpu-refcount.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stackdepot.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/tracepoint-defs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/static_key.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/memremap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/ioport.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/pgtable.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/proc-fns.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/pgtable-prot.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/fixmap.h \
    $(wildcard include/config/acpi/apei/ghes.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/boot.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/fixmap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/pgtable.h \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/huge_mm.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/cdev.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/klist.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pinctrl/devinfo.h \
    $(wildcard include/config/pm.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pinctrl/consumer.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/seq_file.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/key.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pinctrl/pinctrl-state.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/ratelimit.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/device.h \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/xen.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pm_wakeup.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pci.h \
    $(wildcard include/config/pci/iov.h) \
    $(wildcard include/config/pcieaer.h) \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pcie/ptm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci/ats.h) \
    $(wildcard include/config/pci/pri.h) \
    $(wildcard include/config/pci/pasid.h) \
    $(wildcard include/config/pci/domains/generic.h) \
    $(wildcard include/config/pci/bus/addr/t/64bit.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/pcieportbus.h) \
    $(wildcard include/config/pcie/ecrc.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/pci/quirks.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/acpi/mcfg.h) \
    $(wildcard include/config/hotplug/pci.h) \
    $(wildcard include/config/eeh.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mod_devicetable.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/irqreturn.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/irqnr.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/irqnr.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/hardirq.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/hardirq.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/irq.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/irq.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/irq_cpustat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/io.h \
    $(wildcard include/config/has/ioport/map.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/io.h \
  arch/arm64/include/generated/asm/early_ioremap.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/xen/xen.h \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/xen/interface/xen.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/xen/interface.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/xen/arm/interface.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/xen/hypervisor.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/xen/arm/hypervisor.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/vmalloc.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/resource_ext.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kasan.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/pci.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/uapi/linux/pci_regs.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pci_ids.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pci-dma.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dmapool.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/arch/has/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/pci.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dma-mapping.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/dma/set/coherent/mask.h) \
    $(wildcard include/config/need/dma/map/state.h) \
    $(wildcard include/config/dma/api/debug.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dma-debug.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/dma-direction.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/dma-mapping.h \
    $(wildcard include/config/iommu/dma.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/pci-dma-compat.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/arm64/pan.h) \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/kernel-pgtable.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/include/linux/kasan-checks.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/compiler.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/extable.h \
  /home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/cacheflush.h \

/mnt/work/imx/pcie_linux_driver/pci_ccore.o: $(deps_/mnt/work/imx/pcie_linux_driver/pci_ccore.o)

$(deps_/mnt/work/imx/pcie_linux_driver/pci_ccore.o):
