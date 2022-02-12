//
//  GettingLocation.swift
//  clock
//
//  Created by Konstantin Kozhevnikov on 12.02.2022.
//

import Foundation
import UIKit

class LocationManagerView: UIView {
    
    var locationManager = LocationManager()
    var weatheraManager = WeatherManager()
    var weather: ResponseBody?
    
    let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func buttonWeather() {
        
        button.addTarget(self, action: #selector(getLocation), for: .touchUpOutside)
    }
    
    @objc func getLocation() {
        if let location = locationManager.location{
            if let weather = weather {
                WeatherView(weather: weather)
            }
        }
    }
}
