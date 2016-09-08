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

import UIKit

// MARK: AppTableCellViewModel

struct AppTableCellViewModel {
    var app: App
}

// MARK: AppTableCellViewModel: ImagePresentable

extension AppTableCellViewModel: ImagePresentable {
    
    var imageURL: URL? {
        return app.imageURL
    }
    
    var imageName: String? {
        return nil
    }
    
}

// MARK: AppTableCellViewModel: TextPresentable

extension AppTableCellViewModel: TextPresentable {
    
    var text: String {
        return app.name.capitalized
    }
    
    var textColor: UIColor {
        return .black
    }
    
    var font: UIFont {
        return .systemFont(ofSize: 17.0)
    }
    
}

// MARK: AppTableCellViewModel: DetailTextPresentable

extension AppTableCellViewModel: DetailTextPresentable {
    
    var detailText: String {
        return app.category.capitalized
    }
    
    var detailTextColor: UIColor {
        return .lightGray
    }
    
    var detailFont: UIFont {
        return .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
}

