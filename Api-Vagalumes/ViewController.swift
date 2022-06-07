//
//  ViewController.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 17/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {
    let parser = Parser()
    var news = [News]()
    
    @IBOutlet weak var table:UITableView!
    
//    struct Sunset {
//        let title: String
//        let imageName: String
//    }
//
//    let data:[Sunset] = [
//        Sunset(title: "Morning", imageName: "sunset1"),
//        Sunset(title: "Evening Sunset", imageName: "sunset2")
//    ]
    
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
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = news[indexPath.row].featured
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
    
//    @IBAction func cliquei(_ sender: Any) {
//        var sURL:String!
//        
//        sURL = "https://www.vagalume.com.br/news/index.js"
//        
//        let serializer = DataResponseSerializer(emptyResponseCodes: Set([200,204, 205]))
//        
//        var sampleRequest = URLRequest(url: URL(string: sURL)!)
//        
//        AF.request(sampleRequest).uploadProgress{
//            progress in
//        }.response(responseSerializer: serializer){
//                response in
//            if(response.error == nil){
//                var responseString: String!
//                responseString = ""
//                if(response.data != nil){
//                    responseString = String(bytes: response.data!, encoding: .utf8)
//                }else{
//                    responseString = response.response?.description
//                }
//                print(responseString ?? "")
//                print(response.response?.statusCode)
//        
//                do{
//                    let resposta = try JSONDecoder().decode(Welcome.self, from: response.data!)
//                    let data = resposta.news
//                    print(data[0].images)
//                }catch{
//                    print(error)
//                }
//                }
//            }
//            }
}

