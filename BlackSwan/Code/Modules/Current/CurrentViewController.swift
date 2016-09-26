//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CurrentPresenterInput!
    
    var current: Weather!
    var forecast: [Weather]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CurrentConfigurator.sharedInstance.configure(withViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.current = Weather(withTemperature: "...")
        self.forecast = []
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl!.tintColor = UIColor.black
        self.tableView.refreshControl!.addTarget(self, action: #selector(refreshWeather), for: .valueChanged)
        
        self.presenter.loadWeather()
        self.blackStatusBarBackground()
    }
    
    func refreshWeather() {
        self.presenter.loadWeather()
    }
    
    private func blackStatusBarBackground() {
        let screenWidth = UIScreen.main.bounds.width
        let statusView = UIView(frame: CGRect(x: 0, y: 0, width: Int(screenWidth), height: 20))
        
        statusView.backgroundColor = UIColor.black
        self.view.addSubview(statusView)
    }
    
}

extension CurrentViewController: CurrentPresenterOutput {
    
    func refreshCurrent(_ weather: Weather) {
        self.tableView.refreshControl!.endRefreshing()
        
        self.current = weather
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
    }
    
    func refreshForecast(_ forecast: [Weather]) {
        self.forecast = forecast
        self.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
    }
    
}

// MARK: TableView

extension CurrentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        
        switch indexPath.row {
            case 1: return 100
            default: return screenHeight - 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0: return self.setupCurrentCell(tableView, cellForRowAt: indexPath)
            case 1: return self.setupForecastCell(tableView, cellForRowAt: indexPath)
            default: return UITableViewCell()
        }
    }
    
    private func setupCurrentCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: CurrentCell.self, forIndexPath: indexPath)
        cell.setup(withModel: self.current)
        
        return cell
    }
    
    private func setupForecastCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ForecastCell.self, forIndexPath: indexPath)
        cell.setup(withModels: self.forecast)
        
        return cell
    }
    
}