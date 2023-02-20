////
////  ParTableVC.swift
////  FoodDelivery
////
////  Created by Alex Shtandaruk on 11.02.2023.
////
//
//import UIKit
//
//class ParTableVC: UITableViewController {
//    
//    let array = ["1",
//                 "2",
//                 "3",
//                 "4",
//                 "5",
//                 "6",
//                 "7",
//                 "8",
//                 "9",
//                 "10",
//                 "11",
//                 "12"]
//    
//    let viewAdd: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .green
//        return view
//    }()
//    
//    var imageAdd: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .center
//        image.clipsToBounds = true
//        image.layer.borderColor = UIColor.customRed.cgColor
//        image.layer.borderWidth = 1
//        image.layer.cornerRadius = 20
//        return image
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        view.backgroundColor = .red
//        
////        setupView()
////        setupConstraint()
//    }
////
////    func setupView() {
////
////        view.addSubview(viewAdd)
////        viewAdd.addSubview(imageAdd)
////
////    }
////
////    func setupConstraint() {
////
////        viewAdd.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
////        viewAdd.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
////        viewAdd.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
////        viewAdd.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
////
////        imageAdd.topAnchor.constraint(equalTo: viewAdd.topAnchor).isActive = true
////        imageAdd.leadingAnchor.constraint(equalTo: viewAdd.leadingAnchor).isActive = true
////        imageAdd.trailingAnchor.constraint(equalTo: viewAdd.trailingAnchor).isActive = true
////        imageAdd.bottomAnchor.constraint(equalTo: viewAdd.bottomAnchor).isActive = true
////
////    }
//        
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
//        let textData = array[indexPath.row]
//        cell.textLabel?.text = textData
//        return cell
//    }
//    
//    override func viewWillLayoutSubviews() {
//        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//            if indexPath.row == 0 {
//                print("pish")
//                navigationController?.pushViewController(Sale1ViewController(), animated: true)
//            } else if indexPath.row == 1 {
//                navigationController?.pushViewController(Sale2ViewController(), animated: true)
//            } else if indexPath.row == 2 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 3 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 4 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 5 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 6 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 7 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 8 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 9 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 10 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            } else if indexPath.row == 11 {
//                navigationController?.pushViewController(Sale3ViewController(), animated: true)
//            }
//        }
//    }
