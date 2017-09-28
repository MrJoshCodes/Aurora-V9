import 'dart:math';
import 'dart:core';

class Base64Encoding {
  static const int NEGATIVE = 64; // '@'
  static const int POSITIVE = 65; // 'A'

  static String encodeInt(int i, [int numBytes = 2]) {
    String bzRes = '';
    
    for (int j = 1; j <= numBytes; j++) {
      int k = ((numBytes - j) * 6);
      bzRes += new String.fromCharCode(0x40 + ((i >> k) & 0x3f));
    }

    return bzRes;
  }

  static int decodeInt(String bzData){
    int i = 0;
    int j = 0;
    
    for (int k = bzData.length - 1; k >= 0; k--) {
      int x = bzData[k].codeUnitAt(0) - 0x40;
      
      if (j > 0)
        x *= pow(64.0, j).toInt();

      i += x;
      j++;
    }

    return i;
  }

}