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
	shlq	$4, %rax
	movq	%rdi, g_ret_stack(%rax)
	movq	%rsi, g_ret_stack+8(%rax)
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
	movslq	g_ret_sp(%rip), %rcx
	addq	$-1, %rcx
	movl	%ecx, g_ret_sp(%rip)
	shlq	$4, %rcx
	movq	g_ret_stack(%rcx), %rax
	movq	g_ret_stack+8(%rcx), %rdx
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
	movabsq	$223338299444, %rdx     # imm = 0x3400000034
	movq	%rdi, %rax
	retq
.Lfunc_end2:
	.size	mkclosure0, .Lfunc_end2-mkclosure0
	.cfi_endproc
                                        # -- End function
	.globl	mkclosure1              # -- Begin function mkclosure1
	.p2align	4, 0x90
	.type	mkclosure1,@function
mkclosure1:                             # @mkclosure1
	.cfi_startproc
# %bb.0:
	movl	%esi, %edx
	movq	%rdi, %rax
	retq
.Lfunc_end3:
	.size	mkclosure1, .Lfunc_end3-mkclosure1
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
	movl	%edx, %esi
	jmp	printf                  # TAILCALL
.Lfunc_end4:
	.size	main_return, .Lfunc_end4-main_return
	.cfi_endproc
                                        # -- End function
	.globl	case_ackerman_aval_bdec # -- Begin function case_ackerman_aval_bdec
	.p2align	4, 0x90
	.type	case_ackerman_aval_bdec,@function
case_ackerman_aval_bdec:                # @case_ackerman_aval_bdec
	.cfi_startproc
# %bb.0:
                                        # kill: def %edx killed %edx def %rdx
	testl	%esi, %esi
	je	.LBB5_10
# %bb.1:
	movl	%esi, %eax
	.p2align	4, 0x90
.LBB5_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_7 Depth 2
	leal	-1(%rax), %ecx
	testl	%edx, %edx
	je	.LBB5_9
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	movslq	g_ret_sp(%rip), %r9
	movq	%r9, %r8
	movl	%edx, %edi
	testb	$1, %dl
	je	.LBB5_5
# %bb.4:                                #   in Loop: Header=BB5_2 Depth=1
	leaq	1(%r9), %r8
	movq	%r9, %rsi
	shlq	$4, %rsi
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rsi)
	movq	%rcx, g_ret_stack+8(%rsi)
	leal	-1(%rdx), %edi
.LBB5_5:                                #   in Loop: Header=BB5_2 Depth=1
	cmpl	$1, %edx
	je	.LBB5_8
# %bb.6:                                #   in Loop: Header=BB5_2 Depth=1
	shlq	$4, %r8
	leaq	g_ret_stack+24(%r8), %rsi
	.p2align	4, 0x90
.LBB5_7:                                #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	$case_ackerman_aval_bdec, -24(%rsi)
	movq	%rcx, -16(%rsi)
	movq	$case_ackerman_aval_bdec, -8(%rsi)
	movq	%rcx, (%rsi)
	addq	$32, %rsi
	addl	$-2, %edi
	jne	.LBB5_7
.LBB5_8:                                #   in Loop: Header=BB5_2 Depth=1
	addl	%edx, %r9d
	movl	%r9d, g_ret_sp(%rip)
.LBB5_9:                                #   in Loop: Header=BB5_2 Depth=1
	addq	$-1, %rax
	movl	$1, %edx
	testl	%ecx, %ecx
	jne	.LBB5_2
.LBB5_10:
	movslq	g_ret_sp(%rip), %rax
	addq	$-1, %rax
	movl	%eax, g_ret_sp(%rip)
	shlq	$4, %rax
	movq	g_ret_stack(%rax), %rdi
	movq	g_ret_stack+8(%rax), %rsi
	addl	$1, %edx
                                        # kill: def %edx killed %edx killed %rdx
	jmpq	*%rdi                   # TAILCALL
.Lfunc_end5:
	.size	case_ackerman_aval_bdec, .Lfunc_end5-case_ackerman_aval_bdec
	.cfi_endproc
                                        # -- End function
	.globl	ackerman                # -- Begin function ackerman
	.p2align	4, 0x90
	.type	ackerman,@function
ackerman:                               # @ackerman
	.cfi_startproc
# %bb.0:
	movl	%esi, %eax
	testl	%edi, %edi
	je	.LBB6_10
# %bb.1:
	movl	%edi, %ecx
	.p2align	4, 0x90
.LBB6_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_7 Depth 2
	leal	-1(%rcx), %edx
	testl	%eax, %eax
	je	.LBB6_9
# %bb.3:                                #   in Loop: Header=BB6_2 Depth=1
	movl	%eax, %esi
	testb	$1, %al
	je	.LBB6_5
# %bb.4:                                #   in Loop: Header=BB6_2 Depth=1
	movslq	g_ret_sp(%rip), %rsi
	leal	1(%rsi), %edi
	movl	%edi, g_ret_sp(%rip)
	shlq	$4, %rsi
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rsi)
	movq	%rdx, g_ret_stack+8(%rsi)
	leal	-1(%rax), %esi
.LBB6_5:                                #   in Loop: Header=BB6_2 Depth=1
	cmpl	$1, %eax
	je	.LBB6_9
# %bb.6:                                #   in Loop: Header=BB6_2 Depth=1
	movl	g_ret_sp(%rip), %eax
	.p2align	4, 0x90
.LBB6_7:                                #   Parent Loop BB6_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltq
	movq	%rax, %rdi
	shlq	$4, %rdi
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rdi)
	movq	%rdx, g_ret_stack+8(%rdi)
	addl	$2, %eax
	movq	$case_ackerman_aval_bdec, g_ret_stack+16(%rdi)
	movq	%rdx, g_ret_stack+24(%rdi)
	addl	$-2, %esi
	jne	.LBB6_7
# %bb.8:                                #   in Loop: Header=BB6_2 Depth=1
	movl	%eax, g_ret_sp(%rip)
.LBB6_9:                                #   in Loop: Header=BB6_2 Depth=1
	addq	$-1, %rcx
	movl	$1, %eax
	testl	%edx, %edx
	jne	.LBB6_2
.LBB6_10:
	movslq	g_ret_sp(%rip), %rcx
	addq	$-1, %rcx
	movl	%ecx, g_ret_sp(%rip)
	shlq	$4, %rcx
	movq	g_ret_stack(%rcx), %rdi
	movq	g_ret_stack+8(%rcx), %rsi
	addl	$1, %eax
	movl	%eax, %edx
	jmpq	*%rdi                   # TAILCALL
.Lfunc_end6:
	.size	ackerman, .Lfunc_end6-ackerman
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movslq	g_ret_sp(%rip), %rcx
	leaq	1(%rcx), %rax
	leal	16(%rcx), %esi
	leal	17(%rcx), %r8d
	movq	%rcx, %rdi
	shlq	$4, %rdi
	movq	$main_return, g_ret_stack(%rdi)
	movabsq	$223338299444, %rdx     # imm = 0x3400000034
	movq	%rdx, g_ret_stack+8(%rdi)
	leal	18(%rcx), %ecx
	movl	%eax, g_ret_sp(%rip)
	shlq	$4, %rax
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rax)
	movq	$2, g_ret_stack+8(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+16(%rax)
	movq	$2, g_ret_stack+24(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+32(%rax)
	movq	$2, g_ret_stack+40(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+48(%rax)
	movq	$2, g_ret_stack+56(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+64(%rax)
	movq	$2, g_ret_stack+72(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+80(%rax)
	movq	$2, g_ret_stack+88(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+96(%rax)
	movq	$2, g_ret_stack+104(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+112(%rax)
	movq	$2, g_ret_stack+120(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+128(%rax)
	movq	$2, g_ret_stack+136(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+144(%rax)
	movq	$2, g_ret_stack+152(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+160(%rax)
	movq	$2, g_ret_stack+168(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+176(%rax)
	movq	$2, g_ret_stack+184(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+192(%rax)
	movq	$2, g_ret_stack+200(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+208(%rax)
	movq	$2, g_ret_stack+216(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack+224(%rax)
	movslq	%esi, %rdx
	movl	%edx, g_ret_sp(%rip)
	movq	$2, g_ret_stack+232(%rax)
	shlq	$4, %rdx
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rdx)
	movq	$1, g_ret_stack+8(%rdx)
	movslq	%r8d, %rax
	shlq	$4, %rax
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rax)
	movq	$0, g_ret_stack+8(%rax)
	movq	$case_ackerman_aval_bdec, g_ret_stack(%rdx)
	movq	$0, g_ret_stack+8(%rdx)
	movq	$case_ackerman_aval_bdec, g_ret_stack+16(%rdx)
	movq	$0, g_ret_stack+24(%rdx)
	movq	$case_ackerman_aval_bdec, g_ret_stack+32(%rdx)
	movq	$0, g_ret_stack+40(%rdx)
	movl	%ecx, g_ret_sp(%rip)
	movslq	%ecx, %rax
	shlq	$4, %rax
	movq	g_ret_stack(%rax), %rdi
	movq	g_ret_stack+8(%rax), %rsi
	movl	$2, %edx
	callq	*%rdi
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
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
	.comm	g_ret_stack,16000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3


	.ident	"clang version 6.0.0 (https://github.com/llvm-mirror/clang.git 40e9a74cba88c271af3407dad30006386881097b) (https://github.com/llvm-mirror/llvm.git 981877461a4a4387994841065d35f4897fe8dfeb)"
	.section	".note.GNU-stack","",@progbits
