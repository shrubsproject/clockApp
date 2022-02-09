//
//  ViewController.swift
//  clock
//

import UIKit
import CoreLocation

class ClockViewController: UIViewController {

    let imageView = UIImageView()
    let headerLabel = UILabel()
    let switchButton = UISwitch()
    let clockButton = UIButton()
    let watchButton = UIButton()
    let tableView = UITableView(frame: .zero, style: .plain)
    var item = ["Polomoika", "Golovastik", "Bomj"]
    var tableViewHeightConstraint: NSLayoutConstraint!
    
    var clockView: AnalogClockView {
        let view = AnalogClockView(frame: CGRect(x: 0, y: 0, width: 450, height: 350))
        view.center = self.view.center
        return view
    }
    
    var location: CLLocation!
//    var forecast: Forecast?
    var placemark: CLPlacemark?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addClock()
        configureUI()
        configureLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") //  Необходимо продумать представление(сохранение времени, когда)
    }
    
    func addClock() {
        self.view.addSubview(clockView)
    }
    
    func configureUI() {

        view.addSubview(headerLabel)
        view.addSubview(clockButton)
        view.addSubview(watchButton)
        view.addSubview(tableView)
        view.addSubview(imageView)
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)

        headerLabel.font = UIFont.systemFont(ofSize: 35)
        headerLabel.text = "Clock"
        headerLabel.textColor = UIColor(red: 0.192, green: 0.271, blue: 0.416, alpha: 1)

        clockButton.setImage(UIImage(named: "clock"), for: .normal)
        clockButton.addTarget(self, action: #selector(clockTap), for: .touchUpInside)

        watchButton.setImage(UIImage(named: "watch"), for: .normal)
        watchButton.addTarget(self, action: #selector(watchTap), for: .touchUpInside)

        tableView.backgroundColor = UIColor.white
        tableView.separatorColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false

        imageView.image = UIImage(named: "Big")
    }
    
    func configureLayout() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        clockButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 130)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.headerLabelWidth),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingLabel),

            clockButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.clockButtonWidth),
            clockButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.leftClockButton),

            watchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.watchButtonWidth),
            watchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.rightWatchButton),

            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.tableViewWidth), tableViewHeightConstraint,
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingTableView),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: Constants.imageWidth),
            imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.leftImage)
        ])
    }
    
    @objc func clockTap() {
        
    }
    
    @objc func watchTap() {
        
    }
}

extension ClockViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = self.item[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)

        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView

        return cell
        
    }
    
    @objc func switchChanged(_ sender : UISwitch!){

          print("table row switch Changed \(sender.tag)")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You select Index")
    }
}

extension ClockViewController{
    enum Constants{
        static let headerLabelWidth: CGFloat = 15.0
        static let leadingLabel: CGFloat = 40.0
        static let clockButtonWidth: CGFloat = 17.0
        static let leftClockButton: CGFloat = 25.0
        static let watchButtonWidth: CGFloat = 0.0
        static let rightWatchButton: CGFloat = 10.0
        static let tableViewWidth: CGFloat = 25.0
        static let leadingTableView: CGFloat = 10.0
        static let imageWidth: CGFloat = 35.0
        static let leftImage: CGFloat = 22.0
    }
}
