class VoucherType {
  static final VoucherType CREDITS = new VoucherType('CREDITS');
  static final VoucherType TICKETS = new VoucherType('TICKETS');
  static final VoucherType FILM = new VoucherType('FILM');
  static final VoucherType BADGE = new VoucherType('BADGE');
  static final VoucherType FURNITURE = new VoucherType('FURNITURE');
  static final VoucherType CLUB = new VoucherType('CLUB');

  String _type = '';

  VoucherType(String type) {
    _type = type;
  }

  static VoucherType parse(String type) {
    return new VoucherType(type);
  }

  @override
  String toString() {
    return _type;
  }

  @override
  bool operator ==(VoucherType other) {
    return other._type == _type;
  }
}