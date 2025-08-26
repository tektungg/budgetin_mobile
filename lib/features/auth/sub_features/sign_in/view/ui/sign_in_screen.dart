import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),

                // Header
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 80.w,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Sign in to continue to Budgetin',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                // Email Field
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),

                SizedBox(height: 16.h),

                // Password Field
                Obx(() => CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      controller: controller.passwordController,
                      validator: controller.validatePassword,
                      obscureText: !controller.isPasswordVisible,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    )),

                SizedBox(height: 12.h),

                // Remember Me & Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Row(
                          children: [
                            Checkbox(
                              value: controller.rememberMe,
                              onChanged: controller.toggleRememberMe,
                              activeColor: Colors.blue,
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )),
                    TextButton(
                      onPressed: controller.goToForgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                // Sign In Button
                Obx(() => CustomButton(
                      text: 'Sign In',
                      onPressed: controller.signIn,
                      isLoading: controller.isLoading,
                      backgroundColor: Colors.blue,
                    )),

                SizedBox(height: 20.h),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),

                SizedBox(height: 20.h),

                // Google Sign In Button
                Obx(() => CustomButton(
                      text: 'Continue with Google',
                      onPressed: controller.signInWithGoogle,
                      isLoading: controller.isLoading,
                      backgroundColor: Colors.white,
                      textColor: Colors.grey[800],
                      icon: Icon(
                        Icons.g_mobiledata,
                        size: 24.w,
                        color: Colors.red,
                      ),
                    )),

                SizedBox(height: 30.h),

                // Sign Up Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.goToSignUp,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
