class AddWishException implements Exception {
  const AddWishException(this.message);

  final String message;
}

class EditWishException implements Exception {
  const EditWishException(this.message);

  final String message;
}

class DeleteWishException implements Exception {
  const DeleteWishException(this.message);

  final String message;
}

class GellAllWishsException implements Exception {
  const GellAllWishsException(this.message);

  final String message;
}
