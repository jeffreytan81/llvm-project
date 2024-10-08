; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-apple-darwin < %s | FileCheck %s

; A MOV32ri is inside a loop, it has two successors, one successor is inside the
; same loop, the other successor is outside the loop. We should be able to sink
; MOV32ri outside the loop.
; rdar://11980766
define i32 @sink_succ(i32 %argc, ptr nocapture %argv) nounwind uwtable ssp {
; CHECK-LABEL: sink_succ:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  LBB0_1: ## %preheader
; CHECK-NEXT:    ## =>This Loop Header: Depth=1
; CHECK-NEXT:    ## Child Loop BB0_2 Depth 2
; CHECK-NEXT:    ## Child Loop BB0_3 Depth 3
; CHECK-NEXT:    movl $1, %ecx
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  LBB0_2: ## %for.body1.lr
; CHECK-NEXT:    ## Parent Loop BB0_1 Depth=1
; CHECK-NEXT:    ## => This Loop Header: Depth=2
; CHECK-NEXT:    ## Child Loop BB0_3 Depth 3
; CHECK-NEXT:    movl %ecx, %edx
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  LBB0_3: ## %for.body1
; CHECK-NEXT:    ## Parent Loop BB0_1 Depth=1
; CHECK-NEXT:    ## Parent Loop BB0_2 Depth=2
; CHECK-NEXT:    ## => This Inner Loop Header: Depth=3
; CHECK-NEXT:    decl %edx
; CHECK-NEXT:    jne LBB0_3
; CHECK-NEXT:  ## %bb.4: ## %for.inc40.i
; CHECK-NEXT:    ## in Loop: Header=BB0_2 Depth=2
; CHECK-NEXT:    incl %ecx
; CHECK-NEXT:    cmpl $32, %ecx
; CHECK-NEXT:    jne LBB0_2
; CHECK-NEXT:  ## %bb.5: ## %exit
; CHECK-NEXT:    ## in Loop: Header=BB0_1 Depth=1
; CHECK-NEXT:    incl %eax
; CHECK-NEXT:    cmpl $10, %eax
; CHECK-NEXT:    jne LBB0_1
; CHECK-NEXT:  ## %bb.6: ## %for.body2.preheader
; CHECK-NEXT:    movl $2048, %eax ## imm = 0x800
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  LBB0_7: ## %for.body2
; CHECK-NEXT:    ## =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    decl %eax
; CHECK-NEXT:    jne LBB0_7
; CHECK-NEXT:  ## %bb.8: ## %for.end20
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
entry:
  br label %preheader

preheader:
  %i.127 = phi i32 [ 0, %entry ], [ %inc9, %exit ]
  br label %for.body1.lr

for.body1.lr:
  %iv30 = phi i32 [ 1, %preheader ], [ %iv.next31, %for.inc40.i ]
  br label %for.body1

for.body1:
  %iv.i = phi i64 [ 0, %for.body1.lr ], [ %iv.next.i, %for.body1 ]
  %iv.next.i = add i64 %iv.i, 1
  %lftr.wideiv32 = trunc i64 %iv.next.i to i32
  %exitcond33 = icmp eq i32 %lftr.wideiv32, %iv30
  br i1 %exitcond33, label %for.inc40.i, label %for.body1

for.inc40.i:
  %iv.next31 = add i32 %iv30, 1
  %exitcond49.i = icmp eq i32 %iv.next31, 32
  br i1 %exitcond49.i, label %exit, label %for.body1.lr

exit:
  %inc9 = add nsw i32 %i.127, 1
  %exitcond34 = icmp eq i32 %inc9, 10
  br i1 %exitcond34, label %for.body2, label %preheader

for.body2:
  %iv = phi i64 [ %iv.next, %for.body2 ], [ 0, %exit ]
  %iv.next = add i64 %iv, 1
  %lftr.wideiv = trunc i64 %iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 2048
  br i1 %exitcond, label %for.end20, label %for.body2

for.end20:
  ret i32 0
}

define i32 @sink_out_of_loop(i32 %n, ptr %output) {
; CHECK-LABEL: sink_out_of_loop:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    xorl %ecx, %ecx
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  LBB1_1: ## %loop
; CHECK-NEXT:    ## =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    movl %ecx, %eax
; CHECK-NEXT:    movl %ecx, (%rsi,%rcx,4)
; CHECK-NEXT:    incq %rcx
; CHECK-NEXT:    cmpl %edi, %ecx
; CHECK-NEXT:    jl LBB1_1
; CHECK-NEXT:  ## %bb.2: ## %exit
; CHECK-NEXT:    imull %eax, %eax
; CHECK-NEXT:    retq
entry:
  br label %loop

loop:
  %i = phi i32 [ 0, %entry ], [ %i2, %loop ]
  %j = mul i32 %i, %i
  %addr = getelementptr i32, ptr %output, i32 %i
  store i32 %i, ptr %addr
  %i2 = add i32 %i, 1
  %exit_cond = icmp sge i32 %i2, %n
  br i1 %exit_cond, label %exit, label %loop

exit:
  ret i32 %j
}
