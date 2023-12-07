//
//  APIFetchHandler.swift
//  CutCut
//
//  Created by Egor Rybin on 01.11.2023.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    let headers : HTTPHeaders =  [
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Requested-With": "XMLHttpRequest"
    ]
    func fetchAPIData(blade: String, max: String, data: String, complition: @escaping (String)->()) {
      let url = "https://razor-cut.ru/calc/run";
       
       let parameters = [
           "data": "[" + data + "]",//"[2400,2400,2400,2400,2400,816,816,816,816,696,696,696,696,696,696,696,696]",
           "max":max,
           "blade": blade
       ]
       //var resStr = "123"
      AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers, interceptor: nil)
        .response{ resp in
            switch resp.result{
              case .success(let data):
//                let arr = Array(data!)
//                let arr2 = Array(arr)
//                print(arr2)
                if let string = String(bytes: data!, encoding: .utf8) {
                    //print(string)
                    //resStr = string
                    complition(string)
                } else {
                    print("not a valid UTF-8 sequence")
                    //print("not a valid UTF-8 sequence")
                }
                //print(data!)
                //print(data!)
//                do{
//                  //let jsonData = try JSONDecoder().decode([Model].self, from: data!)
//                    let arr = Array(data!)
//                    for subarr in arr {
//                        let sub = [UInt8](arrayLiteral: subarr)
//                        print(sub)
//                    }
//                  print(arr)
//               } catch {
//                  print(error.localizedDescription)
//               }
             case .failure(let error):
                //print(error.localizedDescription)
                //resStr = error.localizedDescription
                print(error.localizedDescription)
             }
        }
   }
}
