//
//  ViewController.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var queryDateLText: UITextField!
    
    var movieList : [MovieApi] = []
    let picker : UIDatePicker = UIDatePicker()
    
    @IBAction func fetchMovie(_ sender: Any) {
        
        self.queryDateLText.endEditing(true)
        
        guard queryDateLText != nil else { return }
        print("----------->\(queryDateLText.text)")
        let date = queryDateLText.text  ?? ""
        let urlconfig = URLSessionConfiguration.default
        let session = URLSession(configuration: urlconfig)
        
        var urlComponents = URLComponents(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=54b9821695ed46aeb98df09fb70f4243&")!
        var queryItem2 = URLQueryItem(name: "targetDt", value: date)
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
            
            
            let movieApi = strongSelf.parse(data: result) ?? []
            strongSelf.movieList = movieApi
            strongSelf.movieList = strongSelf.movieList.map({ movie  in
                var movie2 = movie
                movie2.audi = strongSelf.changeComma(num: &movie2.audi)
                movie2.sales = strongSelf.changeComma(num: &movie2.sales)
                return movie2
                
                
            })
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
                print("----> 계속 업데이트 되는중")
            }
            
            }.resume()
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func doneClick(){
        queryDateLText.endEditing(true)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyyMMdd"
        queryDateLText.text = dateFormatter.string(from: sender.date)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return true
    }
    
    
    func textFieldDidBeginEditing(_ sender: UITextField) {
    
        picker.datePickerMode = .date
        let loc = Locale(identifier: "ko")
        picker.locale = loc
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        toolBar.setItems([doneButton], animated: false)
        sender.inputView  = picker
        sender.inputAccessoryView = toolBar
        picker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: .valueChanged)
    }
    
    
    func parse(data : Data ) -> [MovieApi]?{
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ResponseFirst.self, from: data)
            let movieApi = response.boxOfficeResult.dailyBoxOfficeList
            
            
            return movieApi
        }catch let error {
            print( error.localizedDescription)
            return nil
        }
        
    }
    
    func changeComma(num : inout String ) -> String {
        guard let Dnum = Double(num.count) as? Double , let Inum = Int(num.count) as? Int  else { return "없음" }
        
        if Dnum/Double(3) == Double(Inum/3) {
            var comma = -3
            var count = Inum/3 - 1
            for i in 1...count {
                
                num.insert(",", at: num.index(num.endIndex, offsetBy: comma))
                comma += -4
            }
            return num
            
        }else {
            var count = (Inum/3)
            var comma = -3
            for i in 1...count {
                
                num.insert(",", at: num.index(num.endIndex, offsetBy: comma))
                comma += -4
                
            }
            return num
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieCell else {
            return UITableViewCell() }
        
        cell.configure(movieList : movieList[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
}

extension ViewController : UITableViewDelegate{
    
}



