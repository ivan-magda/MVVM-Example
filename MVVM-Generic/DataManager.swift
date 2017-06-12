/**
 * Copyright (c) 2016 Ivan Magda
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

struct DataManager {
  
  static func dataForResource(_ name: String, completion: @escaping (Data?) -> ()) {
    doInBackground {
      guard let filePath = Bundle.main.url(forResource: name, withExtension: "json") else {
        completion(nil)
        return
      }
      
      let data = try? Data(contentsOf: filePath, options: .uncached)
      
      doOnMain {
        completion(data)
      }
    }
  }
  
  static func jsonForResource(_ name: String, completion: @escaping (_ json: JSONDictionary?) -> ()) {
    dataForResource(name) { completion(parseData($0)) }
  }
  
  private static func parseData(_ data: Data?) -> JSONDictionary? {
    guard let data = data else { return nil }
    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
    return jsonObject.flatMap { $0 as? JSONDictionary }
  }
  
}
