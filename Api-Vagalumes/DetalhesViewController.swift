//
//  DetalhesViewController.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 07/06/22.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    
    @IBOutlet weak var subtitulo: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var link: UITextView!
    @IBOutlet weak var detalhes: UILabel!
    
    var tituloRecebido = String()
    var imagemRecebida = String()
    var subtituloRecebido = String()
    var detalhesRecebido = String()
    var linkRecebido = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = self.tituloRecebido
        subtitulo.text = self.subtituloRecebido
        detalhes.text = self.detalhesRecebido
        var url:String =  "https://www.vagalume.com.br";
        url.append(imagemRecebida);
        imagem.image = converterUrlImagemEmUiImagem(url: url);
        subtitulo.text = subtituloRecebido
        
        let path:String = linkRecebido
        link.text = link.text + " " + linkRecebido
        let text:String = link.text
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: linkRecebido)
        link.attributedText = attributedString
        
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
