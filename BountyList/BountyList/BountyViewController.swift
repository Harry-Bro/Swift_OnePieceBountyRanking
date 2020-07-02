//
//  BountyViewcontrollerViewController.swift
//  BountyList
//
//  Created by HarryBro on 2020/07/01.
//  Copyright © 2020 com.HarryBro. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList: [String] = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList: [Int] = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            // vc는 segue 위치고 DetailViewController이다
            let vc = segue.destination as? DetailViewController
            
            // sender에서 보내온 값을 index로 지정해준다.
            if let index = sender as? Int {
                
                // vc는 DetailViewController이니까
                // vc에 있는 변수에 값을 담아준다. 즉 DetailViewController에 값이 들어간다.
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    // view가 로드 될 때 실행 되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource
    
    // 몇 개의 cell을 보여줄까?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    // cell 구분자를 어떻게 할까
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountylabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }

    
    // UITableViewDelegate
    // 클릭하고 어떻게 할까?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        // 우리가 만든 세그웨이를 실행!
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


// Custom cell

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountylabel: UILabel!
}
