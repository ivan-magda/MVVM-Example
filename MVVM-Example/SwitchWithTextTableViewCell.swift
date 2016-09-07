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

// MARK: SwitchWithTextTableViewCellDelegate: TextPresentable, SwitchPresentable

protocol SwitchWithTextTableViewCellDelegate: TextPresentable, SwitchPresentable, ImagePresentable {
}

// MARK: - SwitchWithTextTableViewCell: UITableViewCell

class SwitchWithTextTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var imageV: UIImageView!
    
    // MARK: Private Variables
    
    private var delegate: SwitchWithTextTableViewCellDelegate?
    
    // MARK: Public
    
    func configure(withDelegate delegate: SwitchWithTextTableViewCellDelegate) {
        self.delegate = delegate
        
        backgroundColor = .clear
        
        label.text = delegate.text
        label.textColor = delegate.textColor
        label.font = delegate.font
        
        switchToggle.isOn = delegate.switchOn
        switchToggle.onTintColor = delegate.switchColor
        
        imageV.image = UIImage(named: delegate.imageName)
    }
    
    // MARK: Actions
    
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchToggleOn(on: sender.isOn)
    }
    
}

// MARK: - SwitchWithTextTableViewCell: CellReuseIdentifierlabel -

extension SwitchWithTextTableViewCell: CellReuseIdentifierabel {
}
