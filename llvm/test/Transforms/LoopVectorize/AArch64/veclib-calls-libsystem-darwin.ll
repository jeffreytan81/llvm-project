; RUN: opt < %s -vector-library=Darwin_libsystem_m -passes=inject-tli-mappings,loop-vectorize -S | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "arm64-apple-darwin"

declare float @expf(float) nounwind readnone
define void @expf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @expf_v4f32(
; CHECK: call <4 x float> @_simd_exp_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @expf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @exp(double) nounwind readnone
define void @exp_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @exp_v2f64(
; CHECK: call <2 x double> @_simd_exp_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @exp(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @acosf(float) nounwind readnone
define void @acos_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acos_v4f32(
; CHECK: call <4 x float> @_simd_acos_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @acosf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @acos(double) nounwind readnone
define void @acos_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acos_v2f64(
; CHECK: call <2 x double> @_simd_acos_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @acos(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @asinf(float) nounwind readnone
define void @asinf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asinf_v4f32(
; CHECK: call <4 x float> @_simd_asin_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @asinf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @asin(double) nounwind readnone
define void @asin_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asin_v2f64(
; CHECK: call <2 x double> @_simd_asin_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @asin(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

 declare float @atanf(float) nounwind readnone
define void @atanf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atanf_v4f32(
; CHECK: call <4 x float> @_simd_atan_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @atanf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @atan(double) nounwind readnone
define void @atan_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan_v2f64(
; CHECK: call <2 x double> @_simd_atan_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @atan(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @atan2f(float, float) nounwind readnone
define void @atan2f_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan2f_v4f32(
; CHECK: call <4 x float> @_simd_atan2_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @atan2f(float %lv, float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @atan2(double, double) nounwind readnone
define void @atan2_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan2_v2f64(
; CHECK: call <2 x double> @_simd_atan2_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @atan2(double %lv, double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @cosf(float) nounwind readnone
define void @cosf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cosf_v4f32(
; CHECK: call <4 x float> @_simd_cos_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @cosf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @cos(double) nounwind readnone
define void @cos_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cos_v2f64(
; CHECK: call <2 x double> @_simd_cos_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @cos(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @sinf(float) nounwind readnone
define void @sinf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sinf_v4f32(
; CHECK: call <4 x float> @_simd_sin_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @sinf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @sin(double) nounwind readnone
define void @sin_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sin_v2f64(
; CHECK: call <2 x double> @_simd_sin_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @sin(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @tanf(float) nounwind readnone
define void @tanf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tanf_v4f32(
; CHECK: call <4 x float> @_simd_tan_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @tanf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @tan(double) nounwind readnone
define void @tan_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tan_v2f64(
; CHECK: call <2 x double> @_simd_tan_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @tan(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.tan.f32(float) nounwind readnone
define void @tan_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tan_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_tan_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.tan.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.tan.f64(double) nounwind readnone
define void @tan_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tan_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_tan_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.tan.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.acos.f32(float) nounwind readnone
define void @acos_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acos_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_acos_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.acos.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.acos.f64(double) nounwind readnone
define void @acos_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acos_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_acos_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.acos.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.asin.f32(float) nounwind readnone
define void @asin_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asin_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_asin_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.asin.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.asin.f64(double) nounwind readnone
define void @asin_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asin_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_asin_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.asin.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.atan.f32(float) nounwind readnone
define void @atan_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_atan_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.atan.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.atan.f64(double) nounwind readnone
define void @atan_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_atan_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.atan.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.atan2.f32(float, float) nounwind readnone
define void @atan2_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan2_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_atan2_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.atan2.f32(float %lv, float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.atan2.f64(double, double) nounwind readnone
define void @atan2_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atan2_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_atan2_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.atan2.f64(double %lv, double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.cosh.f32(float) nounwind readnone
define void @cosh_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cosh_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_cosh_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.cosh.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.cosh.f64(double) nounwind readnone
define void @cosh_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cosh_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_cosh_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.cosh.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.sinh.f32(float) nounwind readnone
define void @sinh_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sinh_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_sinh_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.sinh.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.sinh.f64(double) nounwind readnone
define void @sinh_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sinh_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_sinh_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.sinh.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @llvm.tanh.f32(float) nounwind readnone
define void @tanh_v4f32_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tanh_v4f32_intrinsic(
; CHECK: call <4 x float> @_simd_tanh_f4(<4 x float>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @llvm.tanh.f32(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @llvm.tanh.f64(double) nounwind readnone
define void @tanh_v2f64_intrinsic(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tanh_v2f64_intrinsic(
; CHECK: call <2 x double> @_simd_tanh_d2(<2 x double>
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @llvm.tanh.f64(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}


declare float @cbrtf(float) nounwind readnone
define void @cbrtf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cbrtf_v4f32(
; CHECK: call <4 x float> @_simd_cbrt_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @cbrtf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @cbrt(double) nounwind readnone
define void @cbrt_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cbrt_v2f64(
; CHECK: call <2 x double> @_simd_cbrt_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @cbrt(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @erff(float) nounwind readnone
define void @erff_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @erff_v4f32(
; CHECK: call <4 x float> @_simd_erf_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @erff(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @erf(double) nounwind readnone
define void @erf_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @erf_v2f64(
; CHECK: call <2 x double> @_simd_erf_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @erf(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @powf(float, float) nounwind readnone
define void @powf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @powf_v4f32(
; CHECK: call <4 x float> @_simd_pow_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @powf(float %lv, float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @pow(double, double) nounwind readnone
define void @pow_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @pow_v2f64(
; CHECK: call <2 x double> @_simd_pow_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @pow(double %lv, double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @sinhf(float) nounwind readnone
define void @sinhf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sinhf_v4f32(
; CHECK: call <4 x float> @_simd_sinh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @sinhf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @sinh(double) nounwind readnone
define void @sinh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @sinh_v2f64(
; CHECK: call <2 x double> @_simd_sinh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @sinh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @coshf(float) nounwind readnone
define void @coshf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @coshf_v4f32(
; CHECK: call <4 x float> @_simd_cosh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @coshf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @cosh(double) nounwind readnone
define void @cosh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @cosh_v2f64(
; CHECK: call <2 x double> @_simd_cosh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @cosh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @tanhf(float) nounwind readnone
define void @tanhf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tanhf_v4f32(
; CHECK: call <4 x float> @_simd_tanh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @tanhf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @tanh(double) nounwind readnone
define void @tanh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @tanh_v2f64(
; CHECK: call <2 x double> @_simd_tanh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @tanh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @asinhf(float) nounwind readnone
define void @asinhf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asinhf_v4f32(
; CHECK: call <4 x float> @_simd_asinh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @asinhf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @asinh(double) nounwind readnone
define void @asinh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @asinh_v2f64(
; CHECK: call <2 x double> @_simd_asinh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @asinh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @acoshf(float) nounwind readnone
define void @acoshf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acoshf_v4f32(
; CHECK: call <4 x float> @_simd_acosh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @acoshf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @acosh(double) nounwind readnone
define void @acosh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @acosh_v2f64(
; CHECK: call <2 x double> @_simd_acosh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @acosh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare float @atanhf(float) nounwind readnone
define void @atanhf_v4f32(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atanhf_v4f32(
; CHECK: call <4 x float> @_simd_atanh_f4(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds float, ptr %y, i64 %iv
  %lv = load float, ptr %gep.y, align 4
  %call = tail call float @atanhf(float %lv)
  %gep.x = getelementptr inbounds float, ptr %x, i64 %iv
  store float %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

declare double @atanh(double) nounwind readnone
define void @atanh_v2f64(i64 %n, ptr noalias %y, ptr noalias %x) {
; CHECK-LABEL: @atanh_v2f64(
; CHECK: call <2 x double> @_simd_atanh_d2(
; CHECK: ret void

entry:
  br label %for.body

for.body:
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %entry ]
  %gep.y = getelementptr inbounds double, ptr %y, i64 %iv
  %lv = load double, ptr %gep.y, align 4
  %call = tail call double @atanh(double %lv)
  %gep.x = getelementptr inbounds double, ptr %x, i64 %iv
  store double %call, ptr %gep.x, align 4
  %iv.next = add i64 %iv, 1
  %exitcond = icmp eq i64 %iv.next, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}
