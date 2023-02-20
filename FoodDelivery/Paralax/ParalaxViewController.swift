import UIKit
import Foundation

class ParalaxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private var tableView: UITableView = {
        
        let tableV = UITableView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.backgroundColor = .green
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableV
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "жизньмарт")
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    let model = [ "Question 1",
                  "Question 2",
                  "Question 3",
                  "Question 4",
                  "Question 5",
                  "Question 6",
                  "Question 7",
                  "Question 8",
                  "Question 9",
                  "Question 10",
                  "Question 11"]
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBotton = NSLayoutConstraint()
    private var conteinerViewHeight = NSLayoutConstraint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = imageView
        
        
        setupView()
        setupConstraint()
        setupDelegateDataSource()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            print("pish")
            navigationController?.pushViewController(Sale1ViewController(), animated: true)
        } else if indexPath.row == 1 {
            navigationController?.pushViewController(Sale2ViewController(), animated: true)
        } else if indexPath.row == 2 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 3 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 4 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 5 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 6 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 7 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 8 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 9 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        } else if indexPath.row == 10 {
            navigationController?.pushViewController(Sale3ViewController(), animated: true)
        }
    }
    
    private func setupDelegateDataSource() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupView() {
        
        view.addSubview(tableView)
        
    }
    
    private func setupConstraint() {
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        conteinerViewHeight = imageView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        imageViewBotton = imageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        
        conteinerViewHeight.isActive = true
        imageViewBotton.isActive = true
        imageViewHeight.isActive = true
        
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        conteinerViewHeight.constant = scrollView.contentInset.top
        
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        
        view.clipsToBounds = offsetY <= 0
        imageViewBotton.constant = offsetY >= 0 ? 0: -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
    }
    
}

