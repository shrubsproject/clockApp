//
//  ViewController.swift
//  clock
//

import UIKit

class ClockViewController: UIViewController {

    let imageView = UIImageView()
    let headerLabel = UILabel()
    let switchButton = UISwitch()
    let clockButton = UIButton()
    let watchButton = UIButton()
    let plusButton = UIButton()
    let tableView = UITableView(frame: .zero, style: .plain)
    var item = ["18:15 pm", "19:20 pm"]
    var tableViewHeightConstraint: NSLayoutConstraint!
    
    var clockView: AnalogClockView {
        let view = AnalogClockView(frame: CGRect(x: -27, y: 100, width: 450, height: 450))
        return view

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(table.self, forCellReuseIdentifier: "cell") //  Необходимо продумать представление(сохранение времени, когда)
    }
    
    var weatherDetailData: WeatherInfo? {
            didSet{
                guard let speed = weatherDetailData?.wind.speed,
                    let humidity = weatherDetailData?.main.humidity else {
                    return
                }
                headerLabel.text = "\(speed)"
                headerLabel.text = "\(humidity)"
            }
        }
    
    func configureUI() {

        view.addSubview(headerLabel)
        view.addSubview(clockButton)
        view.addSubview(watchButton)
        view.addSubview(tableView)
        view.addSubview(imageView)
        view.addSubview(plusButton)
        self.view.addSubview(clockView)
        
        view.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
      
        headerLabel.font = UIFont.systemFont(ofSize: 35)
        
        headerLabel.textColor = UIColor(red: 0.192, green: 0.271, blue: 0.416, alpha: 1)

        clockButton.setImage(UIImage(named: "clock"), for: .normal)
        clockButton.addTarget(self, action: #selector(clockTap), for: .touchUpInside)

        watchButton.setImage(UIImage(named: "watch"), for: .normal)
        watchButton.addTarget(self, action: #selector(watchTap), for: .touchUpInside)
        
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)

        tableView.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)

        tableView.separatorColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false

    }
    
    func configureLayout() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        clockButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 130)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.headerLabelWidth),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingLabel),
            
            plusButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plusButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.righPlusButton),

            clockButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.clockButtonWidth),
            clockButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: Constants.leftClockButton),

            watchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.watchButtonWidth),
            watchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.rightWatchButton),

            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.tableViewWidth), tableViewHeightConstraint,
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingTableView),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func clockTap() {
        
    }
    
    @objc func watchTap() {
        
    }
    
    @objc func plus() {
        let viewControllerToPresent = alarmController()
        if let sheet = viewControllerToPresent.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

extension ClockViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! table
        cell.textLabel!.text = self.item[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.89, green: 0.929, blue: 0.969, alpha: 1)
        
        cell.layer.shadowColor = UIColor(red: 0.37, green: 0.52, blue: 0.67, alpha: 0.4).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.8
        cell.layer.cornerRadius = 16

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            Constants.cellHigh
        }
}

extension ClockViewController{
    enum Constants{
        static let headerLabelWidth: CGFloat = 15.0
        static let leadingLabel: CGFloat = 40.0
        static let clockButtonWidth: CGFloat = 0.0
        static let leftClockButton: CGFloat = 10.0
        static let watchButtonWidth: CGFloat = 0.0
        static let rightWatchButton: CGFloat = 10.0
        static let righPlusButton: CGFloat = 10.0
        static let tableViewWidth: CGFloat = 100.0
        static let leadingTableView: CGFloat = 4.0
        static let cellHigh: CGFloat = 63.0
    }
}

