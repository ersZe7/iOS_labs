import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let images: HeroImage

    struct Biography: Decodable {
        let fullName: String
    }

    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroStatsStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }

    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            DispatchQueue.main.async {
                // Update hero image
                self.heroImage.image = heroImage

                // Clear previous content in the stack view
                self.heroStatsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

                // Add hero name
                let nameLabel = UILabel()
                nameLabel.text = hero.name
                nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
                nameLabel.textAlignment = .center
                self.heroStatsStackView.addArrangedSubview(nameLabel)

                // Add hero full name
                let fullNameLabel = UILabel()
                fullNameLabel.text = "Full Name: \(hero.biography.fullName)"
                fullNameLabel.textAlignment = .center
                self.heroStatsStackView.addArrangedSubview(fullNameLabel)

                // Add hero stats dynamically
                let stats = [
                    "Intelligence: \(hero.powerstats.intelligence)",
                    "Strength: \(hero.powerstats.strength)",
                    "Speed: \(hero.powerstats.speed)",
                    "Durability: \(hero.powerstats.durability)",
                    "Power: \(hero.powerstats.power)",
                    "Combat: \(hero.powerstats.combat)"
                ]

                for stat in stats {
                    let statLabel = UILabel()
                    statLabel.text = stat
                    statLabel.textAlignment = .center
                    self.heroStatsStackView.addArrangedSubview(statLabel)
                }
            }
        } catch {
            DispatchQueue.main.async {
                // Clear stack view and show error
                self.heroStatsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
                let errorLabel = UILabel()
                errorLabel.text = "Error: \(error.localizedDescription)\nPlease try again!"
                errorLabel.textAlignment = .center
                self.heroStatsStackView.addArrangedSubview(errorLabel)
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}

