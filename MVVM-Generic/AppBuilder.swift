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

class AppBuilder {
    
    // MARK: Static
    
    static let shared = AppBuilder()
    
    // MARK: Init
    
    private init() {
    }
    
    // MARK: Parsing
    
    class func appsFrom(json: JSONDictionary) -> [App]? {
        guard let feed = json["feed"] as? JSONDictionary,
        let apps = feed["entry"] as? [JSONDictionary] else { return nil }
        
        return apps.flatMap { appFrom(json: $0) }
    }
    
    class func appFrom(json: JSONDictionary) -> App? {
        guard let nameContainer = json["im:name"] as? JSONDictionary,
            let name = nameContainer["label"] as? String else { return nil }
        
        guard let summaryContainer = json["summary"] as? JSONDictionary,
            let summary = summaryContainer["label"] as? String else { return nil }
        
        return App(name: name, summary: summary)
    }
    
}
