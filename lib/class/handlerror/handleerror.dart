class Handleerror {
  String? eror;
  Handleerror(this.eror);
  static Handleerror fromjson(String error) {
    switch (error) {
      case 'weak-password':
        return Handleerror("The password provided is too weak.");

      case "email-already-in-use":
        return Handleerror("The account already exists for that email");

      case "invalid-email":
        return Handleerror("the email address is not valid");
      case "too-many-requests":
        return Handleerror(
            " sent too many requests at the same time, for security the api will not allow too many attemps at the same time, user will have to wait for some time");
      case "network-request-failed":
        return Handleerror(
            "Thrown if there was a network request error, for example the user don't don't have internet connection");

      case "operation-not-allowed":
        return Handleerror(
            "Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab");
      case "account-exists-with-different-credential":
        return Handleerror(
            "Thrown if there already exists an account with the email address asserted by the credential. Resolve this by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of the returned providers. Once the user is signed in, the original credential can be linked to the user with [linkWithCredential].");

      case "invalid-credential":
        return Handleerror(
            "Thrown if the credential is malformed or has expired");

      case "user-disabled":
        return Handleerror(
            "Thrown if the user corresponding to the given credential has been disabled.");
      case "user-not-found":
        return Handleerror(
            "Thrown if signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email.");
      case "invalid-verification-code":
        return Handleerror(
            "he verification code of the credential is not valid");
      case "invalid-verification-id":
        return Handleerror(
            "he verification ID of the credential is not valid.id");

      default:
        return Handleerror(error);
    }
  }
}
