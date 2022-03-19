//
//  SecondViewController.swift
//  TranslatorApp
//
//  Created by Eldiiar on 14/3/22.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    var translated: Results<HistoryModel>?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iTranslator"
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
        view.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(SecondViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1)
        
        tableView.frame = CGRect(x: 20, y: 0, width: 380, height: view.bounds.size.height)
        tableView.separatorStyle = .none
        
        render()
    }
    
    func render() {
        translated = realm.objects(HistoryModel.self)
    }

    func getData(first: String, second: String) {
        let model = HistoryModel()
        model.firstLanguage = first
        model.secondLanguage = second

        if translated != nil {
            try! realm.write {
                realm.delete(translated!)
            }
        }

        do {
            try realm.write({
                realm.add(model)
            })
        } catch {
            print(error.localizedDescription)
        }

        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return translated?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondViewCell
        let item = translated?[indexPath.section]
        cell.setUp(first: item!.firstLanguage, second: item!.secondLanguage)
        cell.layer.cornerRadius = 4
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4
        cell.layer.shadowColor = UIColor(red: 0.536, green: 0.786, blue: 0.786, alpha: 0.25).cgColor
        cell.clipsToBounds = true
        
        return cell
    }

}
