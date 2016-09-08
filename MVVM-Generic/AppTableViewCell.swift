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

class AppTableViewCell<T>: UITableViewCell where T: TextPresentable, T: DetailTextPresentable, T: ImagePresentable {
    
    // MARK: Variables
    
    private lazy var appImageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private lazy var appTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var appDetailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        sharedInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        appImageView.image = nil
    }
    
    // MARK: Public
    
    func configure(withDelegate delegate: T) {
        if let imageURL = delegate.imageURL {
            ImageDownloader.load(withURL: imageURL, completion: { [weak self] in
                self?.appImageView.image = $0
            })
        }
        
        appTitleLabel.text = delegate.text
        appTitleLabel.textColor = delegate.textColor
        appTitleLabel.font = delegate.font
        
        appDetailLabel.text = delegate.detailText
        appDetailLabel.textColor = delegate.detailTextColor
        appDetailLabel.font = delegate.detailFont
    }
    
    // MARK: Private
    
    private func sharedInitialization() {
        addSubview(appImageView)
        addSubview(appTitleLabel)
        addSubview(appDetailLabel)
        
        // Image view constraints.
        NSLayoutConstraint.activate([
            appImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            appImageView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            appImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            appImageView.widthAnchor.constraint(equalTo: appImageView.heightAnchor)]
        )
        
        // Title label constraints.
        NSLayoutConstraint.activate([
            appTitleLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 8),
            appTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)]
        )
        
        NSLayoutConstraint.activate([
            appDetailLabel.leadingAnchor.constraint(greaterThanOrEqualTo: appTitleLabel.trailingAnchor, constant: 8),
            appDetailLabel.centerYAnchor.constraint(equalTo: appTitleLabel.centerYAnchor),
            appDetailLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 8)]
        )
        
        appTitleLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: .horizontal)
        appDetailLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        appImageView.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        appImageView.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .vertical)
    }
    
}

