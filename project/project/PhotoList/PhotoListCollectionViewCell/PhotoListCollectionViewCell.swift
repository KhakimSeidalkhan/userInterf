//
//  PhotoListCollectionViewCell.swift
//  project
//
//  Created by Khakim on 02.02.2022.
//

import UIKit

class PhotoListCollectionViewCell: UICollectionViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "PhotoListCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCountView: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var flag = false
    var likeCount = 0 {
        didSet{
            likeCountView?.text = String(likeCount)
            flag = !flag
        }
    }


    func setData(with data: PhotoListModel) {
        friendName.text = data.friendName
        likeCountView?.text = String(likeCount)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: data.imageName)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
    }

    @objc func like(_ sender: UIButton) {

        switch flag {
        case true:
            self.likeCount -= 1
            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.likeCountView?.textColor = UIColor.black

        case false:
            self.likeCount += 1
            self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.likeCountView?.textColor = UIColor.red
        }
    }
}
