//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by KimMinSeok on 1/11/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let cities = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        cityLabel.text = cities.randomElement()
        let imageName = weathers.randomElement()
        weatherImgView.image = UIImage(systemName: imageName!)?.withRenderingMode(.alwaysOriginal)
        let randomTemp = Int.random(in: 10..<30)
        temperatureLabel.text = "\(randomTemp)°C"
        print("도시, 온도, 날씨 이미지 변경하기!")
    }
}
