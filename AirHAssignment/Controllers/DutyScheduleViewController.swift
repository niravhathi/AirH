//
//  DutyScheduleViewController.swift
//  AirHAssignment
//
//  Created by Nirav Hathi on 10/11/21.
//

import UIKit

class DutyScheduleViewController: UIViewController {
    var dutyScheduleViewModel: DutyScheduleViewModel = DutyScheduleViewModel()
    @IBOutlet weak var tableView: UITableView!
    var numberOfSections: Int = 0
    var dates: [String]?
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Duty Schedule"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        dutyScheduleViewModel.fetchData { result in
            if result {
                self.dates = self.dutyScheduleViewModel.dutyList?.duty.compactMap({ $0.date }).removingDuplicates()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)  {
                    self.tableView.reloadData()
                }
            }
        }
        addRefreshControl()
        tableView.register(UINib(nibName: "DutyTableViewCell", bundle: nil), forCellReuseIdentifier: "DutyTableViewCell")
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view.
    }
    func addRefreshControl() {
        
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        dutyScheduleViewModel.fetchData { result in
            if result {
                self.dates = self.dutyScheduleViewModel.dutyList?.duty.compactMap({ $0.date }).removingDuplicates()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)  {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                    self.dutyScheduleViewModel.isPullToRefresh = false
                }
            }
        }
    }
    
}
extension DutyScheduleViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dutyScheduleViewModel.dutyList?.duty.filter({
            $0.date ==  self.dates?[section]
        }).count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iCell = tableView.dequeueReusableCell(withIdentifier: "DutyTableViewCell", for: indexPath) as! DutyTableViewCell
        var array: [Duty] = []
        for (_,obj) in self.dutyScheduleViewModel.dutyList!.duty.enumerated() {
            if(obj.date ==  self.dates![indexPath.section]) {
                array.append(obj)
            }
        }
        iCell.bind(duty: array[indexPath.row])
        return iCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  self.dates?.count ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headeView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 28))
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: 200, height: 28))
        
        label.text = getDayNameBy(stringDate: self.dates?[section] ?? "")
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        headeView.backgroundColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        headeView.addSubview(label)
        return headeView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetailsViewController", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailsViewController" {
            let detailViewController = segue.destination as! DetailsViewController
            var array: [Duty] = []
            let indexpath = sender as! IndexPath
            for (_,obj) in self.dutyScheduleViewModel.dutyList!.duty.enumerated() {
             
                if(obj.date ==  self.dates![indexpath.section]) {
                    array.append(obj)
                }
            }
            detailViewController.duty = Duty()
            detailViewController.duty = array[indexpath.row]
        }
    }
}
extension Array where Element: Equatable {
    func removingDuplicates() -> Array {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}
func getDayNameBy(stringDate: String) -> String {
    let dateFormatter  = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let date = dateFormatter.date(from: stringDate)
    dateFormatter.dateFormat = "E dd MMM. yyyy"
    return dateFormatter.string(from: date ?? Date())
}
extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
