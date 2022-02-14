//
//  AlarmViewController .swift
//  clock
//
//  Created by Konstantin Kozhevnikov on 14.02.2022.
//

import Foundation
import UIKit

class alarmController: UIViewController{
    
    let saveButton = UIButton()
    let datePicker = UIDatePicker()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    func configureUI() {
        view.addSubview(saveButton)
        view.addSubview(datePicker)
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        
        saveButton.setImage(UIImage(named: "save"), for: .normal)
    }
    
    func configureLayout() {
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
        
        ])
    }
}
