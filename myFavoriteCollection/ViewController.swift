import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    // Данные: список любимых видеоигр
    let games = [
        ("The Legend of Zelda", "Nintendo", "1986"),
        ("God of War", "PlayStation", "2018"),
        ("The Witcher 3", "Multi-Platform", "2015"),
        ("Halo", "Xbox", "2001"),
        ("Super Mario Bros", "Nintendo", "1985"),
        ("Elden Ring", "Multi-Platform", "2022"),
        ("Cyberpunk 2077", "Multi-Platform", "2020"),
        ("CS2", "PC", "2022"),
        ("Read Dear Redemption 2", "Multi-Platform", "2017"),
        ("GTA V", "Multi-Platform", "2013")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - Методы UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        let game = games[indexPath.item]
        cell.titleLabel.text = "Название: \(game.0)"
        cell.platformLabel.text = "Платформа: \(game.1)"
        cell.yearLabel.text = "Год выпуска: \(game.2)"
        return cell
    }

    // MARK: - Методы UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }
}

