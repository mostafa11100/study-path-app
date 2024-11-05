class Handleerror {
  String? eror;
  Handleerror(this.eror);

  static Handleerror fromjson(String error) {
    switch (error) {
      case 'weak-password':
        return Handleerror(
            "The password is too weak. Please choose a stronger one.");

      case "email-already-in-use":
        return Handleerror(
            "This email is already registered. Please use a different email.");

      case "invalid-email":
        return Handleerror(
            "The email address is not valid. Please check the email format.");

      case "too-many-requests":
        return Handleerror(
            "You have made too many requests in a short time. Please wait and try again later.");

      case "network-request-failed":
        return Handleerror(
            "Network error. Please check your internet connection and try again.");

      case "operation-not-allowed":
        return Handleerror(
            "Email and password sign-in is not enabled. Please enable it in Firebase Console.");

      case "account-exists-with-different-credential":
        return Handleerror(
            "An account already exists with this email using a different sign-in method. Please sign in using the correct method.");

      case "invalid-credential":
        return Handleerror(
            "The credentials provided are invalid or have expired. Please try again.");

      case "user-disabled":
        return Handleerror(
            "This account has been disabled. Please contact support for assistance.");

      case "user-not-found":
        return Handleerror(
            "No user found with this email. Please check the email or sign up for a new account.");

      case "invalid-verification-code":
        return Handleerror(
            "The verification code is invalid. Please check and try again.");

      case "invalid-verification-id":
        return Handleerror(
            "The verification ID is invalid. Please check and try again.");

      case 'auth/invalid-email':
        return Handleerror(
            "The email address is invalid. Please check the format.");

      case 'expired-action-code':
        return Handleerror(
            "The password reset code has expired. Please request a new one.");

      case 'invalid-action-code':
        return Handleerror(
            "The password reset code is invalid or has already been used. Please request a new one.");

      case 'auth/missing-android-pkg-name':
        return Handleerror(
            "An Android package name is required if the Android app needs to be installed.");

      case 'auth/missing-continue-uri':
        return Handleerror("A continue URL is required in the request");

      default:
        return Handleerror(error);
    }
  }
}
