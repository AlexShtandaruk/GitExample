//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Alex Shtandaruk on 19.01.2023.
//

import UIKit

class GreetingsViewController: UIViewController {
    
    private var imageView: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        //Флаг, используемый для определения того, как представление размещает свое содержимое при изменении его границ.
        //Возможность масштабировать содержимое в соответствии с размером представления, сохраняя соотношение сторон. Любая оставшаяся область границ представления прозрачна.
        
        return image
    }()
    
    private var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 30)
        label.textAlignment = .center
        
        return label
    }()
    
    private var bodyLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        //Максимальное количество строк для рендеринга текста.
        label.lineBreakMode = .byWordWrapping
        //Техника переноса и обрезания текста этикетки.
        //Значение, указывающее, что перенос происходит на границах слов, если слово не помещается на одной строке
        
        return label
    }()
    
    private var pageControll: UIPageControl = {
        
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        //текущая страница, показанная элементом управления страницей в виде белой точки.
        page.pageIndicatorTintColor = .darkGray
        page.currentPageIndicatorTintColor = .black
        
        return page
        
    }()
    
    private lazy var nextButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont(name: "Doloman Pavljenko Light", size: 23)
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        return button
        
    }()
    
    var data: [[String:String]] =
    [
        ["image":"Delivery", "title":"Fast shiping", "body":"Set your location to start exploring resturant around you"],
        ["image":"Povar", "title":"Varierty of food", "body":"Order dessert and snacks anytime anywhere"],
        ["image":"Home", "title":"Order your favourite food", "body":"Find and order your favourite food and delivery to your home"]
    ]
    
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        setupConstraint()
        pageControll.numberOfPages = data.count
        loadData(selectedRow: row)
        
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        view.addSubview(bodyLabel)
        view.addSubview(pageControll)
        
    }
    
    func setupConstraint() {
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        //Возвращает ограничение, которое определяет атрибут размера якоря как равный указанному якорю, умноженному на константу.
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControll.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30).isActive = true
        
    }
    
    func loadData(selectedRow: Int) {
        
        imageView.image = UIImage(named: data[selectedRow]["image"]!)
        titleLabel.text = data[selectedRow]["title"]
        bodyLabel.text = data[selectedRow]["body"]
        
        pageControll.currentPage = row
        
        row += 1
        
        showAnimation()
    }
    
    func showAnimation() {
        
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: self.view.frame.size.width,
                                                          y: 0)
            
        })
        { (_) in
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                self.titleLabel.alpha = 1
                self.titleLabel.transform = CGAffineTransform(translationX: 0,
                                                              y: 0)
            })
        }
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.5,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: self.view.frame.size.width,
                                                          y: 0)
            
        })
        { (_) in
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                self.bodyLabel.alpha = 1
                self.bodyLabel.transform = CGAffineTransform(translationX: 0,
                                                              y: 0)
            })
        }
    }
    
    func hideAnimatiom() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
            self.titleLabel.alpha = 0
            self.bodyLabel.alpha = 0
        })
    }
    
    @objc func pressedButton() {
        if row == data.count - 1 {
            nextButton.setTitle("Finish", for: .normal)
        }
        if row < data.count {
            hideAnimatiom()
            loadData(selectedRow: row)
        }
    }
    
}

