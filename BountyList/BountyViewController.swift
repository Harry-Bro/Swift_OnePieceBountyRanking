//
//  BountyViewcontrollerViewController.swift
//  BountyList
//
//  Created by HarryBro on 2020/07/01.
//  Copyright © 2020 com.HarryBro. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController {

    let viewModel = BountyInfoViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            // vc는 segue 위치고 DetailViewController이다
            let vc = segue.destination as? DetailViewController
            
            // sender에서 보내온 값을 index로 지정해준다.
            if let index = sender as? Int {
                
                // vc는 DetailViewController이니까
                // vc에 있는 변수에 값을 담아준다. 즉 DetailViewController에 값이 들어간다.
                vc?.name = viewModel.bountyList[index].name
                vc?.bounty = viewModel.bountyList[index].bounty
            }
        }
    }
    
    // view가 로드 될 때 실행 되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension BountyViewController: UITableViewDataSource {
    // UITableViewDataSource
    
    // 몇 개의 cell을 보여줄까?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfbountyList
    }
    
    // cell 구분자를 어떻게 할까
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = viewModel.bountyList[indexPath.row].name
        cell.bountylabel.text = "\(viewModel.bountyList[indexPath.row].bounty)"
        cell.imgView.image = viewModel.bountyList[indexPath.row].img
        
        return cell
    }
}

extension BountyViewController: UITableViewDelegate {
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


class BountyInfoViewModel {
    
    let bountyList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
 
    var numOfbountyList: Int {
        return bountyList.count
    }
}
