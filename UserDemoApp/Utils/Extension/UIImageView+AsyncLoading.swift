import UIKit

extension UIImageView {

    func loadImage(
        from urlString: String,
        placeholder: UIImage? = UIImage(named: "user.png")
    ) {

        //Show placeholder while loading
        Task {
            await MainActor.run {
                self.image = placeholder
            }
        }

        guard NetworkMonitor.shared.isConnected else {
            return
        }

        guard let url = URL(string: urlString) else {
            return
        }

        Task {
            do {
                let (data, response) = try await URLSession.shared.data(
                    from: url)

                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else {
                    Task {
                        await MainActor.run {
                            self.image = placeholder
                        }
                    }
                    return
                }

                guard let image = UIImage(data: data) else {
                    Task {
                        await MainActor.run {
                            self.image = placeholder
                        }
                    }
                    return
                }

                // Update UI on main thread
                await MainActor.run {
                    self.image = image
                }
            } catch {
                print("Failed to load image: \(error)")
                Task {
                    await MainActor.run {
                        self.image = placeholder
                    }
                }
            }
        }
    }
}
