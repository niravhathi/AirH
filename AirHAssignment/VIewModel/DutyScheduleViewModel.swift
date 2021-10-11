//
//  DutyScheduleViewModel.swift
//  AirHAssignment
//
//  Created by Nirav Hathi on 10/11/21.
//


import Foundation
import RealmSwift
import KRProgressHUD
class DutyScheduleViewModel {
    var dutyList: Duties?
    lazy var endPoint: String = {
        return "\(Constants.baseURL)\(Constants.endPoint)"
    }()
    var isPullToRefresh: Bool = false
    func fetchData(completion: @escaping (Bool) -> Void) {
        if NetworkManager.shared.isReachableNetwork() {
            KRProgressHUD.show()
            let webAPIManager = ClientAPIManager()
            webAPIManager.getDataWith(for: endPoint) { (result) in
                switch result{
                case .Success(let data):
                    self.dutyList = Duties.with(json: data)
                    DispatchQueue.main.async {
                        DatabaseManager.shared.storeData(self.dutyList!, type: Duties.self)
                    }
                    KRProgressHUD.dismiss()
                    return completion(true)
                case .Error(let message):
                    print(message)
                    KRProgressHUD.dismiss()
                    return completion(false)
                }
            }
        } else {
            KRProgressHUD.show()
            self.dutyList = DatabaseManager.shared.getAllData()
            if(self.dutyList?.duty.count ?? 0 > 0) {
                KRProgressHUD.dismiss()
                return completion(true)
            } else {
                KRProgressHUD.dismiss()
                return completion(false)
            }
        }
    }
}

