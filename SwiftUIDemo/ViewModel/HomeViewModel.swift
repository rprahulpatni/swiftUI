//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 08/06/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var arrUsers: Array<UsersData> = Array<UsersData>()
    @Published var isShowProgress: Bool = false

    private var resources : UsersResources = UsersResources()
    var totalPages: Int = 0
    var limit: Int = 10
    var skip: Int = 0
    
//    func loadMoreUserList(_ item: UsersData) {
//        let thresholdIndex = self.arrUsers.index(self.arrUsers.endIndex, offsetBy: -1)
//        if thresholdIndex == item.id {
//            if skip <= totalPages {
//                self.getUsersList()
//            }
//        }
//    }
//
    func getUsersList() {
        self.isShowProgress = true
        resources.getUsersList(limit, skip) { [weak self] result in
            switch result {
            case .success(let usersData):
                DispatchQueue.main.async {
                    self?.skip += usersData!.skip == 0 ? usersData!.skip + self!.limit : self!.limit
                    self?.totalPages = usersData!.total
                    self?.limit = usersData!.limit
                    self?.arrUsers.append(contentsOf: usersData!.users)
                    self?.isShowProgress = false
                }
            case .failure(let err):
                print(err.localizedDescription)
                self?.isShowProgress = false
            }
        }
    }
}
