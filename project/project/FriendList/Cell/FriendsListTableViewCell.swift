//
//  FriendsListTableViewCell.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var contactImageView: UIImageView?
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setData(with data: FirendsListCellModel) {
        titleLabel?.text = data.name + " " + data.surnname
        contactImageView?.layer.cornerRadius = 25
        contactImageView?.clipsToBounds = true
        contactImageView?.image = UIImage(named: data.imageName)
    }
}
