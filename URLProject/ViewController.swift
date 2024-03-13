//
//  ViewController.swift
//  URLProject
//
//  Created by Муслим Гаппаров on 3/13/24.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed() {
        guard let url = URL(string: "https://omgvamp-hearthstone-v1.p.rapidapi.com/cardbacks") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let hearthstone = try decoder.decode(Hearthstone.self, from: data)
                print(hearthstone)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

