//
//  ViewController.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 17/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    let parser = Parser()
    var news = [News]()
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse{
            data in
            self.news = data
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true	)
        let controller  = storyboard?.instantiateViewController(identifier: "detalhes") as! DetalhesViewController
        controller.tituloRecebido = news[indexPath.row].featured
        controller.subtituloRecebido = news[indexPath.row].headline
        controller.imagemRecebida = news[indexPath.row].images[2]
        controller.detalhesRecebido = news[indexPath.row].kicker
        controller.linkRecebido = news[indexPath.row].url
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "NewsCell", for:indexPath) as! NewsCell
        cell.textApi.text = news[indexPath.row].headline
        var url:String =  "https://www.vagalume.com.br";
        url.append(news[indexPath.row].images[1]);
        cell.imageView?.image = converterUrlImagemEmUiImagem(url: url);
        return cell
    }
    
    func converterUrlImagemEmUiImagem(url:String) -> UIImage {
            let imageUrlString = url;

            let imageUrl = URL(string: imageUrlString)!;

            let imageData = try! Data(contentsOf: imageUrl);

            let image = UIImage(data: imageData);

            return image!;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
}

