//
//  ViewController.swift
//  clock
//000

import UIKit
import CoreLocation

class ClockViewController: UIViewController {

    let headerLabel = UILabel()
    let switchButton = UISwitch()
    let clockButton = UIButton()
    let watchButton = UIButton()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    var location: CLLocation!
//    var forecast: Forecast?
    var placemark: CLPlacemark?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    func configureUI() {
        
        view.addSubview(headerLabel)
        view.addSubview(clockButton)
        view.addSubview(watchButton)
        view.addSubview(tableView)
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        
        headerLabel.font = UIFont.systemFont(ofSize: 35)
        headerLabel.text = "Clock"
        headerLabel.textColor = UIColor(red: 0.192, green: 0.271, blue: 0.416, alpha: 1)
        
        clockButton.setImage(UIImage(named: "clock"), for: .normal)
        clockButton.addTarget(self, action: #selector(clockTap), for: .touchUpInside)
        
        watchButton.setImage(UIImage(named: "watch"), for: .normal)
        watchButton.addTarget(self, action: #selector(watchTap), for: .touchUpInside)
        
        tableView.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        tableView.separatorColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    func configureLayout() {
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        clockButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.headerLabelWidth),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingLable),
            
            
        ])
    }
    
    @objc func clockTap() {
        
    }
    
    @objc func watchTap() {
        
    }
}
extension ClockViewController{
    enum Constants{
        static let headerLabelWidth: CGFloat = 43.0
        static let leadingLable: CGFloat = 45.0
    }
}
