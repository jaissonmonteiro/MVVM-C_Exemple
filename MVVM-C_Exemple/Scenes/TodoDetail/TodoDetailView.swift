//
//  TodoDetailView.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import SnapKit

class TodoDetailView: UIView {
    
    //MARK: - Subviews
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeLabel(font: .boldSystemFont(ofSize: 30))
    lazy var descriptionLabel = makeLabel(font: .systemFont(ofSize: 16, weight: .regular))
    lazy var updatedLabel = makeLabel(font: .systemFont(ofSize: 14, weight: .thin))
    lazy var stackView = makeStackView()
    
    //MARK: - Properties
    private var imageViewSize: CGFloat { frame.width / 2 }
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Setup methods
    private func setup() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        // imageView
        addSubview(imageView)
        
        // stackView
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        addSubview(stackView)
        
        // updatedLabel
        addSubview(updatedLabel)
    }
    
    private func addConstraints() {
        // imageView
        imageView.snp.makeConstraints { (maker) in
            maker.top.equalTo(safeAreaLayoutGuide).inset(20)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(imageViewSize)
            maker.height.equalTo(imageViewSize)
        }
        
        // stackView
        stackView.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView.snp.bottom).offset(50)
            maker.left.right.equalToSuperview().inset(20)
        }
        
        // updatedLabel
        updatedLabel.snp.makeConstraints { (maker) in
            maker.left.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    //MARK: - Make methods
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = imageViewSize / 2
        return imageView
    }
    
    private func makeLabel(font: UIFont, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.numberOfLines = 0
        return label
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }
}
