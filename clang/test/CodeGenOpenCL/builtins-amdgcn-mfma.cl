// REQUIRES: amdgpu-registered-target
// RUN: %clang_cc1 -triple amdgcn-unknown-unknown -target-cpu gfx908 -DMFMA_GFX908_TESTS -emit-llvm -o - %s | FileCheck %s --check-prefix=CHECK-GFX908
// RUN: %clang_cc1 -triple amdgcn-unknown-unknown -target-cpu gfx90a -DMFMA_GFX90A_TESTS -emit-llvm -o - %s | FileCheck %s --check-prefix=CHECK-GFX90A
// RUN: %clang_cc1 -triple amdgcn-unknown-unknown -target-cpu gfx942 -DMFMA_GFX942_TESTS -emit-llvm -o - %s | FileCheck %s --check-prefix=CHECK-GFX942
// RUN: %clang_cc1 -triple amdgcn-unknown-unknown -target-cpu gfx950 -DMFMA_GFX950_TESTS -emit-llvm -o - %s | FileCheck %s --check-prefix=CHECK-GFX950

#pragma OPENCL EXTENSION cl_khr_fp64:enable

typedef float  v2f   __attribute__((ext_vector_type(2)));
typedef float  v4f   __attribute__((ext_vector_type(4)));
typedef float  v16f  __attribute__((ext_vector_type(16)));
typedef float  v32f  __attribute__((ext_vector_type(32)));
typedef half   v4h   __attribute__((ext_vector_type(4)));
typedef half   v8h   __attribute__((ext_vector_type(8)));
typedef half   v16h  __attribute__((ext_vector_type(16)));
typedef half   v32h  __attribute__((ext_vector_type(32)));
typedef int    v2i   __attribute__((ext_vector_type(2)));
typedef int    v4i   __attribute__((ext_vector_type(4)));
typedef int    v8i   __attribute__((ext_vector_type(8)));
typedef int    v16i  __attribute__((ext_vector_type(16)));
typedef int    v32i  __attribute__((ext_vector_type(32)));
typedef short  v2s   __attribute__((ext_vector_type(2)));
typedef short  v4s   __attribute__((ext_vector_type(4)));
typedef short  v8s   __attribute__((ext_vector_type(8)));
typedef short  v16s  __attribute__((ext_vector_type(16)));
typedef short  v32s  __attribute__((ext_vector_type(32)));
typedef double v4d   __attribute__((ext_vector_type(4)));
typedef __bf16 v8bf16   __attribute__((ext_vector_type(8)));
typedef __bf16 v16bf16   __attribute__((ext_vector_type(16)));


#ifdef MFMA_GFX908_TESTS

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x1f32
// CHECK-GFX908: call <32 x float> @llvm.amdgcn.mfma.f32.32x32x1f32(float %a, float %b, <32 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x1f32(global v32f* out, float a, float b, v32f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x1f32(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x1f32
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.16x16x1f32(float %a, float %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x1f32(global v16f* out, float a, float b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x1f32(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_4x4x1f32
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.4x4x1f32(float %a, float %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_4x4x1f32(global v4f* out, float a, float b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_4x4x1f32(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x2f32
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x2f32(float %a, float %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x2f32(global v16f* out, float a, float b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x2f32(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x4f32
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x4f32(float %a, float %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x4f32(global v4f* out, float a, float b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x4f32(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x4f16
// CHECK-GFX908: call <32 x float> @llvm.amdgcn.mfma.f32.32x32x4f16(<4 x half> %a, <4 x half> %b, <32 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x4f16(global v32f* out, v4h a, v4h b, v32f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x4f16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x4f16
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.16x16x4f16(<4 x half> %a, <4 x half> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x4f16(global v16f* out, v4h a, v4h b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x4f16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_4x4x4f16
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.4x4x4f16(<4 x half> %a, <4 x half> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_4x4x4f16(global v4f* out, v4h a, v4h b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_4x4x4f16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x8f16
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x8f16(<4 x half> %a, <4 x half> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x8f16(global v16f* out, v4h a, v4h b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x8f16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x16f16
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %a, <4 x half> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x16f16(global v4f* out, v4h a, v4h b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x16f16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_i32_32x32x4i8
// CHECK-GFX908: call <32 x i32> @llvm.amdgcn.mfma.i32.32x32x4i8(i32 %a, i32 %b, <32 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_32x32x4i8(global v32i* out, int a, int b, v32i c)
{
  *out = __builtin_amdgcn_mfma_i32_32x32x4i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_i32_16x16x4i8
// CHECK-GFX908: call <16 x i32> @llvm.amdgcn.mfma.i32.16x16x4i8(i32 %a, i32 %b, <16 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_16x16x4i8(global v16i* out, int a, int b, v16i c)
{
  *out = __builtin_amdgcn_mfma_i32_16x16x4i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_i32_4x4x4i8
// CHECK-GFX908: call <4 x i32> @llvm.amdgcn.mfma.i32.4x4x4i8(i32 %a, i32 %b, <4 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_4x4x4i8(global v4i* out, int a, int b, v4i c)
{
  *out = __builtin_amdgcn_mfma_i32_4x4x4i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_i32_32x32x8i8
// CHECK-GFX908: call <16 x i32> @llvm.amdgcn.mfma.i32.32x32x8i8(i32 %a, i32 %b, <16 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_32x32x8i8(global v16i* out, int a, int b, v16i c)
{
  *out = __builtin_amdgcn_mfma_i32_32x32x8i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_i32_16x16x16i8
// CHECK-GFX908: call <4 x i32> @llvm.amdgcn.mfma.i32.16x16x16i8(i32 %a, i32 %b, <4 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_16x16x16i8(global v4i* out, int a, int b, v4i c)
{
  *out = __builtin_amdgcn_mfma_i32_16x16x16i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x2bf16
// CHECK-GFX908: call <32 x float> @llvm.amdgcn.mfma.f32.32x32x2bf16(<2 x i16> %a, <2 x i16> %b, <32 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x2bf16(global v32f* out, v2s a, v2s b, v32f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x2bf16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x2bf16
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.16x16x2bf16(<2 x i16> %a, <2 x i16> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x2bf16(global v16f* out, v2s a, v2s b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x2bf16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_4x4x2bf16
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.4x4x2bf16(<2 x i16> %a, <2 x i16> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_4x4x2bf16(global v4f* out, v2s a, v2s b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_4x4x2bf16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_32x32x4bf16
// CHECK-GFX908: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x4bf16(<2 x i16> %a, <2 x i16> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x4bf16(global v16f* out, v2s a, v2s b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x4bf16(a, b, c, 0, 0, 0);
}

// CHECK-GFX908-LABEL: @test_mfma_f32_16x16x8bf16
// CHECK-GFX908: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x8bf16(<2 x i16> %a, <2 x i16> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x8bf16(global v4f* out, v2s a, v2s b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x8bf16(a, b, c, 0, 0, 0);
}

#endif // MFMA_GFX908_TESTS

#ifdef MFMA_GFX90A_TESTS

// CHECK-GFX90A-LABEL: @test_mfma_f32_32x32x4bf16_1k
// CHECK-GFX90A: call <32 x float> @llvm.amdgcn.mfma.f32.32x32x4bf16.1k(<4 x i16> %a, <4 x i16> %b, <32 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x4bf16_1k(global v32f* out, v4s a, v4s b, v32f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x4bf16_1k(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f32_16x16x4bf16_1k
// CHECK-GFX90A: call <16 x float> @llvm.amdgcn.mfma.f32.16x16x4bf16.1k(<4 x i16> %a, <4 x i16> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x4bf16_1k(global v16f* out, v4s a, v4s b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x4bf16_1k(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f32_4x4x4bf16_1k
// CHECK-GFX90A: call <4 x float> @llvm.amdgcn.mfma.f32.4x4x4bf16.1k(<4 x i16> %a, <4 x i16> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_4x4x4bf16_1k(global v4f* out, v4s a, v4s b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_4x4x4bf16_1k(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f32_32x32x8bf16_1k
// CHECK-GFX90A: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x8bf16.1k(<4 x i16> %a, <4 x i16> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x8bf16_1k(global v16f* out, v4s a, v4s b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f32_16x16x16bf16_1k
// CHECK-GFX90A: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16bf16.1k(<4 x i16> %a, <4 x i16> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x16bf16_1k(global v4f* out, v4s a, v4s b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x16bf16_1k(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f64_16x16x4f64
// CHECK-GFX90A: call <4 x double> @llvm.amdgcn.mfma.f64.16x16x4f64(double %a, double %b, <4 x double> %c, i32 0, i32 0, i32 0)
void test_mfma_f64_16x16x4f64(global v4d* out, double a, double b, v4d c)
{
  *out = __builtin_amdgcn_mfma_f64_16x16x4f64(a, b, c, 0, 0, 0);
}

// CHECK-GFX90A-LABEL: @test_mfma_f64_4x4x4f64
// CHECK-GFX90A: call double @llvm.amdgcn.mfma.f64.4x4x4f64(double %a, double %b, double %c, i32 0, i32 0, i32 0)
void test_mfma_f64_4x4x4f64(global double* out, double a, double b, double c)
{
  *out = __builtin_amdgcn_mfma_f64_4x4x4f64(a, b, c, 0, 0, 0);
}

#endif // MFMA_GFX90A_TESTS

#if defined(MFMA_GFX942_TESTS) || defined(MFMA_GFX950_TESTS)
// CHECK-GFX942-LABEL: @test_mfma_i32_16x16x32_i8
// CHECK-GFX942: call <4 x i32> @llvm.amdgcn.mfma.i32.16x16x32.i8(i64 %a, i64 %b, <4 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_16x16x32_i8(global v4i* out, long a, long b, v4i c)
{
  *out = __builtin_amdgcn_mfma_i32_16x16x32_i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_i32_32x32x16_i8
// CHECK-GFX942: call <16 x i32> @llvm.amdgcn.mfma.i32.32x32x16.i8(i64 %a, i64 %b, <16 x i32> %c, i32 0, i32 0, i32 0)
void test_mfma_i32_32x32x16_i8(global v16i* out, long a, long b, v16i c)
{
  *out = __builtin_amdgcn_mfma_i32_32x32x16_i8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_16x16x8_xf32
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x8.xf32(<2 x float> %a, <2 x float> %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x8_xf32(global v4f* out, v2f a, v2f b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x8_xf32(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_32x32x4_xf32
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x4.xf32(<2 x float> %a, <2 x float> %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x4_xf32(global v16f* out, v2f a, v2f b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x4_xf32(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_16x16x32_bf8_bf8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %a, i64 %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x32_bf8_bf8(global v4f* out, long a, long b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x32_bf8_bf8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_16x16x32_bf8_fp8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.fp8(i64 %a, i64 %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x32_bf8_fp8(global v4f* out, long a, long b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x32_bf8_fp8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_16x16x32_fp8_bf8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.bf8(i64 %a, i64 %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x32_fp8_bf8(global v4f* out, long a, long b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x32_fp8_bf8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_16x16x32_fp8_fp8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %a, i64 %b, <4 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_16x16x32_fp8_fp8(global v4f* out, long a, long b, v4f c)
{
  *out = __builtin_amdgcn_mfma_f32_16x16x32_fp8_fp8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_32x32x16_bf8_bf8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.bf8(i64 %a, i64 %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x16_bf8_bf8(global v16f* out, long a, long b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x16_bf8_bf8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_32x32x16_bf8_fp8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf8.fp8(i64 %a, i64 %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x16_bf8_fp8(global v16f* out, long a, long b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x16_bf8_fp8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_32x32x16_fp8_bf8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.fp8.bf8(i64 %a, i64 %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x16_fp8_bf8(global v16f* out, long a, long b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x16_fp8_bf8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_mfma_f32_32x32x16_fp8_fp8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.fp8.fp8(i64 %a, i64 %b, <16 x float> %c, i32 0, i32 0, i32 0)
void test_mfma_f32_32x32x16_fp8_fp8(global v16f* out, long a, long b, v16f c)
{
  *out = __builtin_amdgcn_mfma_f32_32x32x16_fp8_fp8(a, b, c, 0, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x32_f16
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %a, <8 x half> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x32_f16(global v4f* out, v4h a, v8h b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x32_f16(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x16_f16
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x16.f16(<4 x half> %a, <8 x half> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x16_f16(global v16f* out, v4h a, v8h b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x16_f16(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x32_bf16
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.bf16(<4 x i16> %a, <8 x i16> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x32_bf16(global v4f* out, v4s a, v8s b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x32_bf16(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x16_bf16
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x16.bf16(<4 x i16> %a, <8 x i16> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x16_bf16(global v16f* out, v4s a, v8s b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x16_bf16(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_i32_16x16x64_i8
// CHECK-GFX942: call <4 x i32> @llvm.amdgcn.smfmac.i32.16x16x64.i8(<2 x i32> %a, <4 x i32> %b, <4 x i32> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_i32_16x16x64_i8(global v4i* out, v2i a, v4i b, v4i c, int idx)
{
  *out = __builtin_amdgcn_smfmac_i32_16x16x64_i8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_i32_32x32x32_i8
// CHECK-GFX942: call <16 x i32> @llvm.amdgcn.smfmac.i32.32x32x32.i8(<2 x i32> %a, <4 x i32> %b, <16 x i32> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_i32_32x32x32_i8(global v16i* out, v2i a, v4i b, v16i c, int idx)
{
  *out = __builtin_amdgcn_smfmac_i32_32x32x32_i8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x64_bf8_bf8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.bf8.bf8(<2 x i32> %a, <4 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_bf8_bf8(global v4f* out, v2i a, v4i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_bf8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x64_bf8_fp8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.bf8.fp8(<2 x i32> %a, <4 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_bf8_fp8(global v4f* out, v2i a, v4i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_bf8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x64_fp8_bf8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.bf8(<2 x i32> %a, <4 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_fp8_bf8(global v4f* out, v2i a, v4i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_fp8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_16x16x64_fp8_fp8
// CHECK-GFX942: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %a, <4 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_fp8_fp8(global v4f* out, v2i a, v4i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_fp8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x32_bf8_bf8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.bf8.bf8(<2 x i32> %a, <4 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_bf8_bf8(global v16f* out, v2i a, v4i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_bf8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x32_bf8_fp8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.bf8.fp8(<2 x i32> %a, <4 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_bf8_fp8(global v16f* out, v2i a, v4i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_bf8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x32_fp8_bf8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.fp8.bf8(<2 x i32> %a, <4 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_fp8_bf8(global v16f* out, v2i a, v4i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_fp8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX942-LABEL: @test_smfmac_f32_32x32x32_fp8_fp8
// CHECK-GFX942: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.fp8.fp8(<2 x i32> %a, <4 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_fp8_fp8(global v16f* out, v2i a, v4i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_fp8_fp8(a, b, c, idx, 0, 0);
}
#endif // defined(MFMA_GFX942_TESTS) || defined(MFMA_GFX950_TESTS)

#ifdef MFMA_GFX950_TESTS

// CHECK-GFX950-LABEL: @test_mfma_f32_16x16x32_f16(
// CHECK-GFX950: tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.f16(<8 x half> %a, <8 x half> %b, <4 x float> %c, i32 1, i32 2, i32 3)

v4f test_mfma_f32_16x16x32_f16(v8h a, v8h b, v4f c)
{
  return __builtin_amdgcn_mfma_f32_16x16x32_f16(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_mfma_f32_32x32x16_f16
// CHECK-GFX950: tail call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.f16(<8 x half> %a, <8 x half> %b, <16 x float> %c, i32 1, i32 2, i32 3)
v16f test_mfma_f32_32x32x16_f16(v8h a, v8h b, v16f c)
{
  return __builtin_amdgcn_mfma_f32_32x32x16_f16(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_mfma_f32_32x32x16_bf16(
// CHECK-GFX950: tail call <16 x float> @llvm.amdgcn.mfma.f32.32x32x16.bf16(<8 x bfloat> %a, <8 x bfloat> %b, <16 x float> %c, i32 1, i32 2, i32 3)
v16f test_mfma_f32_32x32x16_bf16(v8bf16 a, v8bf16 b, v16f c) {
  return __builtin_amdgcn_mfma_f32_32x32x16_bf16(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_mfma_scale_f32_16x16x128_f8f6f4
// CHECK-GFX950: [[EXTRACT_A:%.+]] = shufflevector <8 x i32> %a, <8 x i32> poison, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v6i32.v8i32(<6 x i32> [[EXTRACT_A]], <8 x i32> %b, <4 x float> %c, i32 3, i32 1, i32 2, i32 %scale_a, i32 3, i32 %scale_b)
void test_mfma_scale_f32_16x16x128_f8f6f4(global v4f* out, v8i a, v8i b, v4f c, int scale_a, int scale_b)
{
  *out = __builtin_amdgcn_mfma_scale_f32_16x16x128_f8f6f4(a, b, c, 3, 1, 2, scale_a, 3, scale_b);
}

// CHECK-GFX950-LABEL: @test_mfma_scale_f32_32x32x64_f8f6f4
// CHECK-GFX950: [[EXTRACT_A:%.+]] = shufflevector <8 x i32> %a, <8 x i32> poison, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.mfma.scale.f32.32x32x64.f8f6f4.v6i32.v8i32(<6 x i32> [[EXTRACT_A]], <8 x i32> %b, <16 x float> %c, i32 3, i32 1, i32 2, i32 %scale_a, i32 3, i32 %scale_b)
void test_mfma_scale_f32_32x32x64_f8f6f4(global v16f* out, v8i a, v8i b, v16f c, int scale_a, int scale_b)
{
  *out = __builtin_amdgcn_mfma_scale_f32_32x32x64_f8f6f4(a, b, c, 3, 1, 2, scale_a, 3, scale_b);
}

// CHECK-GFX950-LABEL: @test_mfma_i32_16x16x64_i8(
// CHECK-GFX950: tail call <4 x i32> @llvm.amdgcn.mfma.i32.16x16x64.i8(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c, i32 1, i32 2, i32 3)
v4i test_mfma_i32_16x16x64_i8(v4i a, v4i b, v4i c) {
  return __builtin_amdgcn_mfma_i32_16x16x64_i8(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_mfma_i32_32x32x32_i8(
// CHECK-GFX950: tail call <16 x i32> @llvm.amdgcn.mfma.i32.32x32x32.i8(<4 x i32> %a, <4 x i32> %b, <16 x i32> %c, i32 1, i32 2, i32 3)
v16i test_mfma_i32_32x32x32_i8(v4i a, v4i b, v16i c) {
  return __builtin_amdgcn_mfma_i32_32x32x32_i8(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_mfma_f32_16x16x32_bf16(
// CHECK-GFX950: tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf16(<8 x bfloat> %a, <8 x bfloat> %b, <4 x float> %c, i32 1, i32 2, i32 3)
v4f test_mfma_f32_16x16x32_bf16(v8bf16 a, v8bf16 b, v4f c)
{
  return __builtin_amdgcn_mfma_f32_16x16x32_bf16(a, b, c, 1, 2, 3);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x64_f16
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.f16(<8 x half> %a, <16 x half> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_f16(global v4f* out, v8h a, v16h b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_f16(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x32_f16
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.f16(<8 x half> %a, <16 x half> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_f16(global v16f* out, v8h a, v16h b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_f16(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x64_bf16
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.bf16(<8 x bfloat> %a, <16 x bfloat> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x64_bf16(global v4f* out, v8bf16 a, v16bf16 b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x64_bf16(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x32_bf16
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x32.bf16(<8 x bfloat> %a, <16 x bfloat> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x32_bf16(global v16f* out, v8bf16 a, v16bf16 b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x32_bf16(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_i32_16x16x128_i8
// CHECK-GFX950: call <4 x i32> @llvm.amdgcn.smfmac.i32.16x16x128.i8(<4 x i32> %a, <8 x i32> %b, <4 x i32> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_i32_16x16x128_i8(global v4i* out, v4i a, v8i b, v4i c, int idx)
{
  *out = __builtin_amdgcn_smfmac_i32_16x16x128_i8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_i32_32x32x64_i8
// CHECK-GFX950: call <16 x i32> @llvm.amdgcn.smfmac.i32.32x32x64.i8(<4 x i32> %a, <8 x i32> %b, <16 x i32> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_i32_32x32x64_i8(global v16i* out, v4i a, v8i b, v16i c, int idx)
{
  *out = __builtin_amdgcn_smfmac_i32_32x32x64_i8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x128_bf8_bf8
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x128.bf8.bf8(<4 x i32> %a, <8 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x128_bf8_bf8(global v4f* out, v4i a, v8i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x128_bf8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x128_bf8_fp8
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x128.bf8.fp8(<4 x i32> %a, <8 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x128_bf8_fp8(global v4f* out, v4i a, v8i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x128_bf8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x128_fp8_bf8
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x128.fp8.bf8(<4 x i32> %a, <8 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x128_fp8_bf8(global v4f* out, v4i a, v8i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x128_fp8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_16x16x128_fp8_fp8
// CHECK-GFX950: call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x128.fp8.fp8(<4 x i32> %a, <8 x i32> %b, <4 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_16x16x128_fp8_fp8(global v4f* out, v4i a, v8i b, v4f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_16x16x128_fp8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x64_bf8_bf8
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x64.bf8.bf8(<4 x i32> %a, <8 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x64_bf8_bf8(global v16f* out, v4i a, v8i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x64_bf8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x64_bf8_fp8
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x64.bf8.fp8(<4 x i32> %a, <8 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x64_bf8_fp8(global v16f* out, v4i a, v8i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x64_bf8_fp8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x64_fp8_bf8
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x64.fp8.bf8(<4 x i32> %a, <8 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x64_fp8_bf8(global v16f* out, v4i a, v8i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x64_fp8_bf8(a, b, c, idx, 0, 0);
}

// CHECK-GFX950-LABEL: @test_smfmac_f32_32x32x64_fp8_fp8
// CHECK-GFX950: call <16 x float> @llvm.amdgcn.smfmac.f32.32x32x64.fp8.fp8(<4 x i32> %a, <8 x i32> %b, <16 x float> %c, i32 %idx, i32 0, i32 0)
void test_smfmac_f32_32x32x64_fp8_fp8(global v16f* out, v4i a, v8i b, v16f c, int idx)
{
  *out = __builtin_amdgcn_smfmac_f32_32x32x64_fp8_fp8(a, b, c, idx, 0, 0);
}

#endif
