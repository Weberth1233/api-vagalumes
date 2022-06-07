//
//  Parse.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 31/05/22.
//
import UIKit
import Alamofire
import SwiftyJSON
import Foundation

struct Parser {
    
    func parse(comp: @escaping ([News])->()){
        var data: [News] = [];
        
        var sURL:String!
        sURL = "https://www.vagalume.com.br/news/index.js"
        let serializer = DataResponseSerializer(emptyResponseCodes: Set([200,204, 205]))
        var sampleRequest = URLRequest(url: URL(string: sURL)!)
            
            AF.request(sampleRequest).uploadProgress{
                progress in
            }.response(responseSerializer: serializer){
                    response in
                if(response.error == nil){
                    var responseString: String!
                    responseString = ""
                    if(response.data != nil){
                        responseString = String(bytes: response.data!, encoding: .utf8)
                    }else{
                        responseString = response.response?.description
                    }
                    print(responseString ?? "")
                    print(response.response?.statusCode)

                    do{
                        let resposta = try JSONDecoder().decode(Welcome.self, from: response.data!)
                        comp(resposta.news)
                
                    }catch{
                        print(error)
                    }
                    }
            }
    }
}
