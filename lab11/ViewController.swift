import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!

    var heroManager = HeroManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        heroManager.delegate = self
        getLocalHero()
    }

    @IBAction private func onHeroDidTap(_ sender: UIButton) {
        heroManager.fetchHero()
    }
}

extension ViewController: HeroManagerDelegate {
    func onHeroDidUpdate(hero: HeroModel) {
        configure(hero: hero)
        saveHero(hero)
    }

    private func getLocalHero() {
//        if
//            let storedName = UserDefaults.standard.string(forKey: "heroName"),
//            let storedImage = UserDefaults.standard.string(forKey: "heroImage")
//        {
//            titleLabel.text = storedName
//            heroImage.kf.setImage(with: URL(string: storedImage))
//        }
        if
            let heroData = UserDefaults.standard.data(forKey: "heroData"),
            let storedHero = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
        {
            configure(hero: storedHero)
        }
    }

    private func saveHero(_ hero: HeroModel) {
//        UserDefaults.standard.set(hero.name, forKey: "heroName")
//        UserDefaults.standard.set(hero.images.sm, forKey: "heroImage")

        guard let heroData = try? PropertyListEncoder().encode(hero) else {
            return
        }
        UserDefaults.standard.set(heroData, forKey: "heroData")
    }

    private func configure(hero: HeroModel) {
        titleLabel.text = hero.name
        heroImage.kf.setImage(with: URL(string: hero.images.sm))
    }
}
