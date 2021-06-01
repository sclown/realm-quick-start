import UIKit

final class DataSource: NSObject, UICollectionViewDataSource {
    private var tasks: [String] = []
    private let dataBase = DataBase()
    
    func attach(to collection: UICollectionView) {
        collection.dataSource = self
        collection.register(UICollectionViewListCell.self)
        tasks = dataBase.load()
    }
    
    func append(_ item: String) {
        tasks.append(item)
        dataBase.save(item)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewListCell = collectionView.dequeCell(indexPath: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.item]
        cell.contentConfiguration = content
        return cell
    }
}
