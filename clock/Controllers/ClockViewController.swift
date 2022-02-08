//
//  ViewController.swift
//  clock
//

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
    
    var tableViewHeightConstraint: NSLayoutConstraint!
    
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
        
        tableView.backgroundColor = UIColor.black
        tableView.separatorColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    func configureLayout() {
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        clockButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 110)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingLabel),
            
            clockButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.clockButtonWidth),
            clockButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.leftClockButton),
            
            watchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.watchButtonWidth),
            watchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: Constants.rightWatchButton),
            
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constants.tableViewWidth), tableViewHeightConstraint,
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingTableView),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
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
        static let leadingLabel: CGFloat = 45.0
        static let clockButtonWidth: CGFloat = 5.0
        static let leftClockButton: CGFloat = 25.0
        static let watchButtonWidth: CGFloat = 5.0
        static let rightWatchButton: CGFloat = 5.0
        static let tableViewWidth: CGFloat = 25.0
        static let leadingTableView: CGFloat = 10.0
    }
}
