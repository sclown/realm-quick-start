import UIKit
import RealmSwift

final class DataSource: NSObject, UICollectionViewDataSource {
    private var tasks: Results<RealmItem>?
    private let dataBase = DataBase()
    
    func attach(to collection: UICollectionView) {
        collection.dataSource = self
        collection.register(UICollectionViewListCell.self)
        tasks = dataBase.load()
    }
    
    func append(_ item: String) {
        dataBase.save(item)
    }
    
    func timeInfo(for index: Int) -> RealmItemTime? {
        guard let item = tasks?[index] else { return nil }
        if item.time != nil {
            return item.time
        }
        return dataBase.timeInfo(for: item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewListCell = collectionView.dequeCell(indexPath: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tasks?[indexPath.item].title
        cell.contentConfiguration = content
        return cell
    }
}
