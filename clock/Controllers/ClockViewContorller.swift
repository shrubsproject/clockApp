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
    }
    
    func configureUI() {
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        
    }
}
