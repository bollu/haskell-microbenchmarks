	.text
	.file	"test.c"
	.globl	pushReturn              # -- Begin function pushReturn
	.p2align	4, 0x90
	.type	pushReturn,@function
pushReturn:                             # @pushReturn
	.cfi_startproc
# %bb.0:
	movslq	g_ret_sp(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, g_ret_sp(%rip)
	movq	%rdi, g_ret_stack(,%rax,8)
	retq
.Lfunc_end0:
	.size	pushReturn, .Lfunc_end0-pushReturn
	.cfi_endproc
                                        # -- End function
	.globl	popReturn               # -- Begin function popReturn
	.p2align	4, 0x90
	.type	popReturn,@function
popReturn:                              # @popReturn
	.cfi_startproc
# %bb.0:
	movslq	g_ret_sp(%rip), %rax
	leaq	-1(%rax), %rcx
	movl	%ecx, g_ret_sp(%rip)
	movq	g_ret_stack-8(,%rax,8), %rax
	retq
.Lfunc_end1:
	.size	popReturn, .Lfunc_end1-popReturn
	.cfi_endproc
                                        # -- End function
	.globl	mkclosure0              # -- Begin function mkclosure0
	.p2align	4, 0x90
	.type	mkclosure0,@function
mkclosure0:                             # @mkclosure0
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	retq
.Lfunc_end2:
	.size	mkclosure0, .Lfunc_end2-mkclosure0
	.cfi_endproc
                                        # -- End function
	.globl	main_return             # -- Begin function main_return
	.p2align	4, 0x90
	.type	main_return,@function
main_return:                            # @main_return
	.cfi_startproc
# %bb.0:
	movl	$.L.str, %edi
	xorl	%eax, %eax
	jmp	printf                  # TAILCALL
.Lfunc_end3:
	.size	main_return, .Lfunc_end3-main_return
	.cfi_endproc
                                        # -- End function
	.globl	compute_return          # -- Begin function compute_return
	.p2align	4, 0x90
	.type	compute_return,@function
compute_return:                         # @compute_return
	.cfi_startproc
# %bb.0:
	movslq	g_ret_sp(%rip), %rax
	leaq	-1(%rax), %rcx
	movl	%ecx, g_ret_sp(%rip)
	movq	g_ret_stack-8(,%rax,8), %rdi
	addl	$1, %esi
	jmpq	*%rdi                   # TAILCALL
.Lfunc_end4:
	.size	compute_return, .Lfunc_end4-compute_return
	.cfi_endproc
                                        # -- End function
	.globl	compute                 # -- Begin function compute
	.p2align	4, 0x90
	.type	compute,@function
compute:                                # @compute
	.cfi_startproc
# %bb.0:
	testl	%edi, %edi
	je	.LBB5_1
	.p2align	4, 0x90
.LBB5_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_5:                                #   Parent Loop BB5_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%eax, g(%rip)
	leal	1(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	2(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	3(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	4(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	5(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	6(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	7(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	8(%rax), %ecx
	movl	%ecx, g(%rip)
	leal	9(%rax), %ecx
	movl	%ecx, g(%rip)
	addl	$10, %eax
	cmpl	$1000, %eax             # imm = 0x3E8
	jne	.LBB5_5
# %bb.3:                                #   in Loop: Header=BB5_4 Depth=1
	movslq	g_ret_sp(%rip), %rcx
	leal	1(%rcx), %eax
	movl	%eax, g_ret_sp(%rip)
	movq	$compute_return, g_ret_stack(,%rcx,8)
	addl	$-1, %edi
	jne	.LBB5_4
	jmp	.LBB5_2
.LBB5_1:
	movl	g_ret_sp(%rip), %eax
.LBB5_2:
	leal	-1(%rax), %ecx
	movl	%ecx, g_ret_sp(%rip)
	cltq
	movq	g_ret_stack-8(,%rax,8), %rdi
	xorl	%esi, %esi
	jmpq	*%rdi                   # TAILCALL
.Lfunc_end5:
	.size	compute, .Lfunc_end5-compute
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movslq	g_ret_sp(%rip), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, g_ret_sp(%rip)
	movq	$main_return, g_ret_stack(,%rax,8)
	movl	$80000, %edx            # imm = 0x13880
	.p2align	4, 0x90
.LBB6_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_2 Depth 2
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_2:                                #   Parent Loop BB6_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%esi, g(%rip)
	leal	1(%rsi), %edi
	movl	%edi, g(%rip)
	leal	2(%rsi), %edi
	movl	%edi, g(%rip)
	leal	3(%rsi), %edi
	movl	%edi, g(%rip)
	leal	4(%rsi), %edi
	movl	%edi, g(%rip)
	leal	5(%rsi), %edi
	movl	%edi, g(%rip)
	leal	6(%rsi), %edi
	movl	%edi, g(%rip)
	leal	7(%rsi), %edi
	movl	%edi, g(%rip)
	leal	8(%rsi), %edi
	movl	%edi, g(%rip)
	leal	9(%rsi), %edi
	movl	%edi, g(%rip)
	addl	$10, %esi
	cmpl	$1000, %esi             # imm = 0x3E8
	jne	.LBB6_2
# %bb.3:                                #   in Loop: Header=BB6_1 Depth=1
	movq	$compute_return, g_ret_stack(,%rcx,8)
	leaq	1(%rcx), %rcx
	movl	%ecx, g_ret_sp(%rip)
	addl	$-1, %edx
	jne	.LBB6_1
# %bb.4:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leal	79999(%rax), %eax
	movl	%eax, g_ret_sp(%rip)
	cltq
	movq	g_ret_stack(,%rax,8), %rdi
	movl	$1, %esi
	callq	*%rdi
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	g_ret_sp,@object        # @g_ret_sp
	.bss
	.globl	g_ret_sp
	.p2align	2
g_ret_sp:
	.long	0                       # 0x0
	.size	g_ret_sp, 4

	.type	g_ret_stack,@object     # @g_ret_stack
	.comm	g_ret_stack,8000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	g,@object               # @g
	.bss
	.globl	g
	.p2align	2
g:
	.long	0                       # 0x0
	.size	g, 4


	.ident	"clang version 6.0.0 (https://github.com/llvm-mirror/clang.git 40e9a74cba88c271af3407dad30006386881097b) (https://github.com/llvm-mirror/llvm.git 981877461a4a4387994841065d35f4897fe8dfeb)"
	.section	".note.GNU-stack","",@progbits
