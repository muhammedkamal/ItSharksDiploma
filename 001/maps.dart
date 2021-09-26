/**
 * Map<keyDataType,valueDataType> identifier = { key1:value1, key2:value2 [,…..,key_n:value_n] }
 */

void main() {
  Map<String, int> countCodes = {
    "eg": 20,
    "usa": 1,
  };
  print(countCodes);
  // access the value from the key
  print(countCodes['eg']);
  // update the value
  countCodes['eg'] = 30;
  print(countCodes['eg']);
  // add new key:value
  countCodes['fr'] = 13;
  // add new entry if absent
  countCodes.putIfAbsent('ksa', () => 99);
  print(countCodes);
}
