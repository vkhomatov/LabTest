//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class MyLabPresenter {

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?
    private var state: LoginState
    private var userModel: UserModel
    private var region: Region = .init()
    
    // MARK: - Initialization

    init() {
        self.userModel = .init(region: region)
        self.state = .logout(.init(headerViewModel: .init(from: userModel),
                                   contentViewModel: .init(from: userModel)))
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        view?.configureViewState(with: state)
        getAndSaveTokenAndRegion()
    }
    
    func exitButtonPush() {
        userModel = .init(region: region)
        state = .logout(.init(headerViewModel: .init(from: userModel),
                                   contentViewModel: .init(from: userModel)))
        view?.configureViewState(with: state)
    }
    
    func enterButtonPush() {
        router?.openLoginScreen(delegate: self)
    }
    
    func cellPressed(of type: MyLabRowTypes) {
        print("Cell of type \(type) pressed")
    }

}

// MARK: - Private Methods

private extension MyLabPresenter {

    func getAndSaveTokenAndRegion(update: Bool = true) {
        if let savedToken = try? KeyChainService().readToken(), !update {
            debugPrint("Saved token from KeyChain = \(savedToken)")
        } else {
            UserService().getToken(with: ParametersService().makeParams(add: ["token" : ""]))
                .onCompleted { [weak self] data in
                    guard let self = self else { return }
                    if let token = data.token {
                        guard let _ = try? KeyChainService().updateToken(token: token) else {
                            try? KeyChainService().saveToken(token: token)
                            return
                        }
                    }
                    if let region = data.region {
                        self.region = region
                        self.userModel = .init(region: region)
                        self.state = .logout(.init(headerViewModel: .init(from: self.userModel), contentViewModel: .init(from: self.userModel)))
                        self.view?.configureViewState(with: self.state)
                    }
                }.onError { error in
                    debugPrint(error.localizedDescription)
                }
        }
    }
}

// MARK: - LoginDiscountCodeViewControllerDelegate

extension MyLabPresenter: LoginDiscountCodePresenterDelegate {

    func loadUserModel(userModel: UserModel) {
        self.userModel = userModel
        self.state = .login(.init(headerViewModel: .init(from: userModel), contentViewModel: .init(from: userModel)))
        view?.configureViewState(with: state)
    }

}
