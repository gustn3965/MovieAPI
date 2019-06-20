//
//  DetailViewController.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var codeList : String = ""
    var detailList : Detail? = nil
    
    
    
    @IBOutlet weak var title2: UILabel!
    
    
    @IBOutlet weak var openDt: UILabel!
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var nations: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var directors: UILabel!
    @IBOutlet weak var audits: UILabel!
    @IBOutlet weak var staffs: UILabel!
    @IBOutlet weak var companys: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    
    func updateUI() {
        
        guard let code = self.codeList as? String else { return }
        print("----->\(code)")
        
        let urlconfig = URLSessionConfiguration.default
        let session = URLSession(configuration: urlconfig)
        
        var urlComponents = URLComponents(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=54b9821695ed46aeb98df09fb70f4243&")!
        let queryItem2 = URLQueryItem(name: "movieCd", value: code)
        urlComponents.queryItems?.append(queryItem2)
        guard let url = urlComponents.url else { return }
        
        print("------> \(urlComponents.host!)")
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let strongSelf =  self else { return }
            guard error == nil else { return }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode  else { return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else { return }
            
            guard let result = data else { return }
            
            
            let movieApi = strongSelf.parse(data: result) ?? nil
            strongSelf.detailList = movieApi
            
            print(strongSelf.detailList!)
            
            let a = strongSelf.detailList!.openDt!
            print(strongSelf.detailList!.actors.map({ actor in
                return actor.peopleNm
            }))
            //            let b = strongSelf.detailList!.companys
            
            
            DispatchQueue.main.async {
                strongSelf.title2.text = strongSelf.detailList?.title
                
                
                strongSelf.openDt.text = "개봉날짜 :   \(strongSelf.detailList!.openDt!)"
                strongSelf.count.text = "상영횟수 :   \(strongSelf.detailList!.count!) 회"
                strongSelf.nations.text =  strongSelf.detailList!.nations.map({ nation  in
                    return nation.nationNm
                }).joined(separator: "")
                
                let act = strongSelf.detailList!.actors.map({ actor in
                    return actor.peopleNm
                }).joined(separator: "   ")
                strongSelf.actors.text = "배우   :   \(act)"
                
                let dic = strongSelf.detailList!.directors.map({ actor in
                    return actor.peopleNm
                }).joined(separator: " ")
                strongSelf.directors.text = "감독 :   \(dic)"
                
                let aud = strongSelf.detailList!.audits.map({ actor in
                    return actor.watchGradeNm
                }).joined(separator: "   ")
                strongSelf.audits.text = "관람가 :   \(aud)"
                
                let staf = strongSelf.detailList!.staffs.map({ actor in return actor.peopleNm
                }).joined(separator: "   ")
                strongSelf.staffs.text = "스태프 :   \(staf) "
                
                let comp = strongSelf.detailList!.companys.map({ actor in return actor.companyNm
                }).joined(separator: "   ")
                strongSelf.companys.text = "배급사 :   \(comp) "
                
                //
                
                
            }
            
            
            }.resume()
        
    }
    
    func parse(data : Data ) -> Detail?{
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ResponseFirstDatail.self, from: data)
            let movieApi = response.movieInfoResult.movieInfo
            //            let movieNation = response.movieInfoResult.movieInfo.nations
            
            
            return movieApi
        }catch let error {
            print( error.localizedDescription)
            return nil
        }
        
    }
    
    
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
