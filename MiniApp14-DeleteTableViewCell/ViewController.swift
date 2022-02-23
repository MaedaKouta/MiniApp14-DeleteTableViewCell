//
//  ViewController.swift
//  MiniApp14-DeleteTableViewCell
//
//  Created by 前田航汰 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private let initDatas = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]
    private var datas: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        datas = initDatas
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            textLabel.text = "\(datas[indexPath.row])が削除されました"
            textLabel2.text = "\(datas.count - 1)個の県が残されています"
            datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    @IBAction func didTapResetButton(_ sender: Any) {
        datas = initDatas
        tableView?.reloadData()
        textLabel.text = "初期値に戻りました"
        textLabel2.text = "\(datas.count)個の県が残されています"
    }

}

