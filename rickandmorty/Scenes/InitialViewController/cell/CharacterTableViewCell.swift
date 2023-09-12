//
//  CharacterTableViewCell.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.addRoundCorner()
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: UIFont.nameOf.Georgia_Bold.rawValue, size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var lifeStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: UIFont.nameOf.Georgia_Italic.rawValue, size: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setupView() {
        selectionStyle = .none
        separatorInset = .init(top: 0, left: 10.0, bottom: 0, right: 10.0)
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lifeStatusLabel)

        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 200),
            mainImageView.widthAnchor.constraint(equalToConstant: 200),
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),

            titleLabel.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            lifeStatusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            lifeStatusLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10.0),
            lifeStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupCell(character: Home.ResultResponse?) {
        guard let character = character
        else {
            return
        }

        titleLabel.text = character.name?.capitalized
        lifeStatusLabel.text = character.status?.capitalized
        guard let imageViewURL = character.image,
              let url = URL(string: imageViewURL)
        else {
            return
        }

        mainImageView.sd_setImage(
            with: url,
            placeholderImage: UIImage(named: "placeHolderImage"),
            context: nil,
            progress: nil
        )
    }
}
