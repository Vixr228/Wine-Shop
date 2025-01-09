import UIKit

protocol BasketViewInput: AnyObject {
    
}

class BasketViewController: BaseViewController<BasketView> {
    
    var output: BasketViewOutput!
    var dataProvider = DataProvider()
    var wineData = [WineInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
//        mainView.collectionView.delegate = self
//        mainView.collectionView.dataSource = self
//        mainView.collectionView.register(BasketCell.self, forCellWithReuseIdentifier: BasketCell.description())
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(BasketCell.self, forCellReuseIdentifier: BasketCell.description())
        mainView.tableView.register(EditBasketCell.self, forCellReuseIdentifier: EditBasketCell.description())

        mainView.navBar.rightButton.addTarget(self, action: #selector(selectButtonPressed), for: .touchUpInside)
    }
    
    @objc func selectButtonPressed() {
        let current = mainView.tableView.isEditing
        mainView.tableView.setEditing(!current, animated: true)
        mainView.tableView.reloadData()
    }
    
}

extension BasketViewController: BasketViewInput {
    
}

//MARK: TableView Delegate
extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 180// Add the spacing to the cell height
       }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
}

//MARK: TableView DataSource
extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wineData = dataProvider.getWines()
        return wineData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      print("hhahahaha")
        let wine = wineData[indexPath.row]
        
        if tableView.isEditing {
            print("isEdit")
            let cell = tableView.dequeueReusableCell(withIdentifier: EditBasketCell.description(), for: indexPath) as! EditBasketCell
            cell.selectionStyle = .none
            
            cell.wineLabel.text = wine.name
            cell.fromLabel.text = wine.country
            cell.wineImage.image = wine.image
            cell.priceLabel.text = "\(String(wine.price!)) ₽"
            cell.desription.text = "\(wine.colour!) \(wine.sugar!) вино,\n\(wine.grapeType!), \(String(wine.alcoStrength!))%"
            
            return cell
        }
        print("no edit")
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.description(), for: indexPath) as! BasketCell
        cell.selectionStyle = .none
        
        cell.wineLabel.text = wine.name
        cell.fromLabel.text = wine.country
        cell.wineImage.image = wine.image
        cell.priceLabel.text = "\(String(wine.price!)) ₽"
        cell.desription.text = "\(wine.colour!) \(wine.sugar!) вино,\n\(wine.grapeType!), \(String(wine.alcoStrength!))%"
        
        return cell
    }
    
    
}

//MARK: CollectionView DataSource
//extension BasketViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        wineData = dataProvider.getWines()
//        return wineData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        wineData = dataProvider.getWines()
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCell.description(), for: indexPath) as! BasketCell
//
//
//        let wine = wineData[indexPath.row]
//
//        cell.wineLabel.text = wine.name
//        cell.fromLabel.text = wine.country
//        cell.wineImage.image = wine.image
//        cell.priceLabel.text = "\(String(wine.price!)) ₽"
//        cell.desription.text = "\(wine.colour!) \(wine.sugar!) вино,\n\(wine.grapeType!), \(String(wine.alcoStrength!))%"
//
//        return cell
//    }
//}
//
//
//MARK: CollectionView Delegate
//extension BasketViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("ASDDDD")
//    }
//
//}
//
//MARK: CollectionView CollectionViewDelegateFlowLayout
//extension BasketViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.size.width
//        return CGSize(width: width, height: 180.0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
//    }
//}
//
