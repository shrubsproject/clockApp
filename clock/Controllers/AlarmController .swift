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
    let textL = UILabel()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    func configureUI() {
        view.addSubview(saveButton)
        view.addSubview(datePicker)
        view.addSubview(textL)
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        
        saveButton.setImage(UIImage(named: "save"), for: .normal)
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
    }
    
    func configureLayout() {
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        textL.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50.0),
            datePicker.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25.0),
            datePicker.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25.0),
            
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15.0),
          
            textL.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textL.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125.0)
        ])
    }
    
    @objc func save(){
    
    }
    
    @objc func dateChange() {
        formatter.dateFormat = "dd/MM/yyyy/HH:mm"
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        textL.text = formatter.string(from: datePicker.date)
        textL.font = UIFont.systemFont(ofSize: 19)
    }
}
