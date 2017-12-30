	.text
	.file	"test.c"
	.globl	compute                 # -- Begin function compute
	.p2align	4, 0x90
	.type	compute,@function
compute:                                # @compute
	.cfi_startproc
# %bb.0:
	testl	%edi, %edi
	je	.LBB0_1
# %bb.2:
	movl	%edi, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, g(%rip)
	leal	1(%rcx), %edx
	movl	%edx, g(%rip)
	leal	2(%rcx), %edx
	movl	%edx, g(%rip)
	leal	3(%rcx), %edx
	movl	%edx, g(%rip)
	leal	4(%rcx), %edx
	movl	%edx, g(%rip)
	leal	5(%rcx), %edx
	movl	%edx, g(%rip)
	leal	6(%rcx), %edx
	movl	%edx, g(%rip)
	leal	7(%rcx), %edx
	movl	%edx, g(%rip)
	leal	8(%rcx), %edx
	movl	%edx, g(%rip)
	leal	9(%rcx), %edx
	movl	%edx, g(%rip)
	addl	$10, %ecx
	cmpl	$1000, %ecx             # imm = 0x3E8
	jne	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	addl	$-1, %eax
	jne	.LBB0_3
# %bb.6:
	movl	%edi, %eax
	retq
.LBB0_1:
	xorl	%edi, %edi
	movl	%edi, %eax
	retq
.Lfunc_end0:
	.size	compute, .Lfunc_end0-compute
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	$80000, %eax            # imm = 0x13880
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, g(%rip)
	leal	1(%rcx), %edx
	movl	%edx, g(%rip)
	leal	2(%rcx), %edx
	movl	%edx, g(%rip)
	leal	3(%rcx), %edx
	movl	%edx, g(%rip)
	leal	4(%rcx), %edx
	movl	%edx, g(%rip)
	leal	5(%rcx), %edx
	movl	%edx, g(%rip)
	leal	6(%rcx), %edx
	movl	%edx, g(%rip)
	leal	7(%rcx), %edx
	movl	%edx, g(%rip)
	leal	8(%rcx), %edx
	movl	%edx, g(%rip)
	leal	9(%rcx), %edx
	movl	%edx, g(%rip)
	addl	$10, %ecx
	cmpl	$1000, %ecx             # imm = 0x3E8
	jne	.LBB1_2
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$-1, %eax
	jne	.LBB1_1
# %bb.4:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	movl	$80000, %esi            # imm = 0x13880
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	g,@object               # @g
	.bss
	.globl	g
	.p2align	2
g:
	.long	0                       # 0x0
	.size	g, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3


	.ident	"clang version 6.0.0 (https://github.com/llvm-mirror/clang.git 40e9a74cba88c271af3407dad30006386881097b) (https://github.com/llvm-mirror/llvm.git 981877461a4a4387994841065d35f4897fe8dfeb)"
	.section	".note.GNU-stack","",@progbits
