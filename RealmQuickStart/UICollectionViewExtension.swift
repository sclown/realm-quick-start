import UIKit

extension UICollectionView {
    func dequeCell<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: NSStringFromClass(Cell.self),
            for: indexPath
        ) as? Cell
        else {
            preconditionFailure("Unexpected cell type")
        }
        return cell
    }
    
    func register(_ cellClass: AnyClass)
    {
        self.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
}
