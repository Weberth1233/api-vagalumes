//
//  DetalhesViewController.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 07/06/22.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var imageApi: UIImageView!
    @IBOutlet weak var texto: UILabel!
    var dadoRecebido = String()
    var image = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.texto.text = self.dadoRecebido
        var url:String =  "https://www.vagalume.com.br";
        url.append(image);
        imageApi.image = converterUrlImagemEmUiImagem(url: url);
        // Do any additional setup after loading the view.
    }
    
    
    func converterUrlImagemEmUiImagem(url:String) -> UIImage {
            let imageUrlString = url;

            let imageUrl = URL(string: imageUrlString)!;

            let imageData = try! Data(contentsOf: imageUrl);

            let image = UIImage(data: imageData);

            return image!;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
