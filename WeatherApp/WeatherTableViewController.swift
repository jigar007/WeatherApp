//
//  TableViewController.swift
//  WeatherApp
//
//  Created by Jigar Thakkar on 12/9/21.
//

import UIKit

class WeatherTableViewController: UITableViewController {


//    var arrayWeather: [WeatherInformation] = [WeatherInformation]()


    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager().fetchWeatherInfo(withCityIDs: "2147714") { response in

        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}

extension WeatherTableViewController {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherInformationCell",
                                                       for: indexPath) as? WeatherInfoCell else {
            fatalError("WeatherCell not found")
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailViewController", sender: indexPath)
    }
}
