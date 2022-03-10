//
//  MyLabViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


final class MyLabViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Properties

    private lazy var adapter = tableView.rddm.manualBuilder
        .add(plugin: .selectable())
        .build()

    // MARK: - Properties

    var output: MyLabViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        setupTableView()
        fillAdapter(with: true)
    }

}

// MARK: - Private Methods

private extension MyLabViewController {
    
    func setupTableView() {
        
        let bundle = Bundle(for: type(of: self))

        tableView.register(UINib(nibName: "StandartReusableCell", bundle: bundle), forCellReuseIdentifier: "StandartReusableCell")
        tableView.register(UINib(nibName: "DeliveryAddressCell", bundle: bundle), forCellReuseIdentifier: "DeliveryAddressCell")
        tableView.register(UINib(nibName: "ExitButtonCell", bundle: bundle), forCellReuseIdentifier: "ExitButtonCell")
        tableView.register(UINib(nibName: "AutorizedHeaderView", bundle: bundle), forHeaderFooterViewReuseIdentifier: "AutorizedHeaderView")
        tableView.register(UINib(nibName: "UnautorizedHeaderView", bundle: bundle), forHeaderFooterViewReuseIdentifier: "UnautorizedHeaderView")

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag

        view.addSubview(tableView)
    }
    
    
    func fillAdapter(with login: Bool) {
/// ToDo:  реализация для просмотра верстки, заменить на модели logout и login в дальнейшем
        if login {
            let header = AutorizedHeaderGenerator()
            adapter.addSectionHeaderGenerator(header)
        } else {
            let header = UnautorizedHeaderGenerator()
            adapter.addSectionHeaderGenerator(header)
        }
        
        if login {
            let myOrdersModel = StandartReusableCellViewModel(title: L10n.myOrders, value: "1 в обработке", valueTextColor: StandartReusableCell.Constants.redColor)
            let myOrdersGenerator = BaseCellGenerator<StandartReusableCell>(with: myOrdersModel)
            adapter.addCellGenerator(myOrdersGenerator)

            let myCouponsModel = StandartReusableCellViewModel(title: L10n.myCoupons, value: "1 сгорает", valueTextColor: StandartReusableCell.Constants.redColor)
            let myCouponsGenerator = BaseCellGenerator<StandartReusableCell>(with: myCouponsModel)
            adapter.addCellGenerator(myCouponsGenerator)

            let savingGoodsModel = StandartReusableCellViewModel(title: L10n.savingGoods, value: "367", valueTextColor: StandartReusableCell.Constants.greyColor)
            let savingGoodsGenerator = BaseCellGenerator<StandartReusableCell>(with: savingGoodsModel)
            adapter.addCellGenerator(savingGoodsGenerator)

            let mySubscriptionsModel = StandartReusableCellViewModel(title: L10n.mySubscriptions, value: "78 обновлений", valueTextColor: StandartReusableCell.Constants.redColor)
            let mySubscriptionsGenerator = BaseCellGenerator<StandartReusableCell>(with: mySubscriptionsModel)
            adapter.addCellGenerator(mySubscriptionsGenerator)

            let purchasedGoodsModel = StandartReusableCellViewModel(title: L10n.purchasedGoods, value: nil, valueTextColor: nil)
            let purchasedGoodsGenerator = BaseCellGenerator<StandartReusableCell>(with: purchasedGoodsModel)
            adapter.addCellGenerator(purchasedGoodsGenerator)

            let myReviewsModel = StandartReusableCellViewModel(title: L10n.myReviews, value: nil, valueTextColor: nil)
            let myReviewsGenerator = BaseCellGenerator<StandartReusableCell>(with: myReviewsModel)
            adapter.addCellGenerator(myReviewsGenerator)

            let _156PickupPointsModel = StandartReusableCellViewModel(title: L10n._156PickupPoints, value: nil, valueTextColor: nil)
            let _156PickupPointsGenerator = BaseCellGenerator<StandartReusableCell>(with: _156PickupPointsModel)
            adapter.addCellGenerator(_156PickupPointsGenerator)

            let profileSettingsModel = StandartReusableCellViewModel(title: L10n.profileSettings, value: nil, valueTextColor: nil)
            let profileSettingsGenerator = BaseCellGenerator<StandartReusableCell>(with: profileSettingsModel)
            adapter.addCellGenerator(profileSettingsGenerator)

        }

        let deliveryModel = DeliveryAddressCellViewModel(title: L10n.delivery, address: "г. Петропавловск, от 1600 р. бесплатно, доставим завтра")
        let deliveryGenerator = BaseNonReusableCellGenerator<DeliveryAddressCell>(with: deliveryModel)
        adapter.addCellGenerator(deliveryGenerator)

        let appSettingsModel = StandartReusableCellViewModel(title: L10n.appSettings, value: nil, valueTextColor: nil)
        let appSettingsGenerator = BaseCellGenerator<StandartReusableCell>(with: appSettingsModel)
        adapter.addCellGenerator(appSettingsGenerator)

        let storeInformationModel = StandartReusableCellViewModel(title: L10n.storeInformation, value: nil, valueTextColor: nil)
        let storeInformationGenerator = BaseCellGenerator<StandartReusableCell>(with: storeInformationModel)
        adapter.addCellGenerator(storeInformationGenerator)

        if login {
            let model = ExitButtonCellViewModel(title: L10n.logout)
            let logoutGenerator = BaseNonReusableCellGenerator<ExitButtonCell>(with: model)
            adapter.addCellGenerator(logoutGenerator)
        }

        adapter.forceRefill()

    }
    
}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput {

    func setupInitialState() {
        
    }

}
