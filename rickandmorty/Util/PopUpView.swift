//
//  PopUpView.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit
import SDWebImage

class PopUpView: UIView {

    private var character: Home.ResultResponse

    init(character: Home.ResultResponse) {
        self.character = character
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(removePopUpHandler))
        self.addGestureRecognizer(tap)

        //addBlurEffect(effect: .light)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewContainer)
        addSubview(characterImage)
        addSubview(titleLabel)
        addSubview(creationLabel)
        addSubview(statusLabel)
        addSubview(specieLabel)
        addSubview(typeLabel)
        addSubview(locationLabel)

        NSLayoutConstraint.activate([
            viewContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
            viewContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8),
            viewContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewContainer.centerYAnchor.constraint(equalTo: centerYAnchor),

            characterImage.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            characterImage.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: characterImage.topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0),

            creationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0),
            creationLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            creationLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0),

            statusLabel.topAnchor.constraint(equalTo: creationLabel.bottomAnchor, constant: 10.0),
            statusLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            statusLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0),

            specieLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10.0),
            specieLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            specieLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0),

            typeLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 10.0),
            typeLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            typeLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0),

            locationLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10.0),
            locationLabel.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 10.0),
            locationLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -10.0)
        ])
    }

    @objc func removePopUpHandler() {
        removePopUp()
    }

    lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_setImage(
            with: URL(string: character.image ?? ""),
            placeholderImage: UIImage(named: "placeHolderImage"),
            context: nil,
            progress: nil
        )
        imageView.addBlurEffect()
        imageView.addRoundCorner()
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia_Bold.rawValue , size: 24.0)
        label.text = character.name
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var creationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue , size: 20.0)
        label.text = "Creado: \(character.created?.getDateInString() ?? "")"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue , size: 20.0)
        label.text = "Estado: \(character.status ?? "")"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue , size: 20.0)
        label.text = "Especie: \(character.species ?? "")"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue , size: 20.0)
        label.text = "Origen: \(character.origin?.name ?? "")"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue , size: 20.0)
        label.text = "Localización: \(character.location?.name ?? "N/A")"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
}
