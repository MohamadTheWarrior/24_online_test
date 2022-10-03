class AnonymousSignInFailure implements Exception {
  const AnonymousSignInFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory AnonymousSignInFailure.fromCode(String code) {
    switch (code) {
      case "operation-not-allowed":
        return const AnonymousSignInFailure(
          "Anonymous auth hasn't been enabled for this project",
        );
      default:
        return const AnonymousSignInFailure();
    }
  }

  final String message;
}

class AnonymousSignOutFailure implements Exception {
  const AnonymousSignOutFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory AnonymousSignOutFailure.fromCode(String code) {
    switch (code) {
      case "operation-not-allowed":
        return const AnonymousSignOutFailure(
          "Anonymous auth hasn't been enabled for this project",
        );
      default:
        return const AnonymousSignOutFailure();
    }
  }

  final String message;
}
