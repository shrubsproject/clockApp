//
//  Table.swift
//  clock
//
//  Created by Konstantin Kozhevnikov on 10.02.2022.
//

import Foundation
import UIKit

class table: UITableViewCell{
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 4
            super.frame = frame
        }
    }
}
