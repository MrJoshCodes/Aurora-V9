import 'tuple.dart';

class WireEncoding {
  static const int NEGATIVE = 72; // 'H'
  static const int POSITIVE = 73; // 'I'
  static const int MAX_INTEGER_BYTE_AMOUNT = 6;

  static String encodeInt(int i) {
    List<int> wf = new List(WireEncoding.MAX_INTEGER_BYTE_AMOUNT);
    int pos = 0;
    int numBytes = 1;
    int startPos = pos;
    int negativeMask = i >= 0 ? 0 : 4;
    i = i.ceil();
    wf[pos++] = (64 + (i & 3));

    for (i >>= 2; i != 0; i >>= WireEncoding.MAX_INTEGER_BYTE_AMOUNT) {
      numBytes++;
      wf[pos++] = (64 + (i & 0x3f));
    }
    
    wf[startPos] = (wf[startPos] | numBytes << 3 | negativeMask);

    List<int> wf2 = new List();

    for (int i = 0; i < numBytes; i++) {
      wf2.add(wf[i]);
    }

    return new String.fromCharCodes(wf2);
  }

  static Tuple decodeInt(String bzData) {
    int pos = 0;
    int v = bzData[pos].codeUnitAt(0) & 3;
    bool negative = (bzData[pos].codeUnitAt(0) & 4) == 4;
    int totalBytes = bzData[pos++].codeUnitAt(0) >> 3 & 7;
    int shiftAmount = 2;

    for (int b = 1; b < totalBytes; b++) {
        v |= (bzData[pos].codeUnitAt(0) & 0x3f) << shiftAmount;
        shiftAmount = 2 + 6 * b;
        pos++;
    }

    if (negative == true)
        v *= -1;

    return new Tuple(v, totalBytes);
  }
}