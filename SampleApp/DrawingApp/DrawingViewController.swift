//
//  DrawingViewController.swift
//  SampleApp
//
//  Created by ravindu jayasekara on 2024-09-20.
//

import UIKit

struct TreeNode<Value> {
    var value: Value
    var children: [TreeNode]
    
    init(name: Value) {
        self.value = name
        self.children = []
    }
    
    mutating func add(child: TreeNode) {
        self.children.append(child)
    }
}

class DrawingViewController: UIViewController {
    
    var treeList = [TreeNode<String>]()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(TreeTableViewCell.self, forCellReuseIdentifier: TreeTableViewCell.identifier)
        return tableview
    }()
    
    private let curveView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    func curveLine() -> CAShapeLayer {
        let rect = UIBezierPath()
        
        rect.move(to: CGPoint(x: 20, y: 30))
        rect.addLine(to: CGPoint(x: 20, y: 50))
        rect.addCurve(to: CGPoint(x: 35, y: 70), controlPoint1: CGPoint(x: 20, y: 60), controlPoint2: CGPoint(x: 25, y: 70))
        
        let rectShape = CAShapeLayer()
        rectShape.path = rect.cgPath
        rectShape.lineWidth = 4.0
        rectShape.fillColor = UIColor.clear.cgColor
        rectShape.strokeColor = UIColor.orange.cgColor
        rectShape.lineCap = .round
        return rectShape
    }
    
    func straightLine() -> CAShapeLayer {
        let rect = UIBezierPath()
        
        rect.move(to: CGPoint(x: 20, y: 50))
        rect.addLine(to: CGPoint(x: 20, y: 75))
        
        let shape = CAShapeLayer()
        shape.path = rect.cgPath
        shape.lineWidth = 4.0
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.orange.cgColor
        return shape
    }
    
    func setupUI() {
        
        var parent1 = TreeNode(name: "Parent 1")
        let child1 = TreeNode(name: "Child 1")
        parent1.add(child: child1)
        var parent2 = TreeNode(name: "Parent 2")
        let child2 = TreeNode(name: "Child 2")
        parent2.add(child: child2)
        
        treeList = [parent1, parent2]
        
        let rectShape = curveLine()
        let straightLine = straightLine()
        curveView.layer.addSublayer(rectShape)
        curveView.layer.addSublayer(straightLine)
        
        containerView.addSubview(curveView)
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            curveView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            curveView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 100),
            curveView.heightAnchor.constraint(equalToConstant: 200),
            curveView.widthAnchor.constraint(equalToConstant: 200),
            
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
