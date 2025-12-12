//
//  GFFollowerItemVC.swift
//  iOS-Native-Training
//
//  Created by MIN on 12/12/25.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor:  .systemGreen, title: "Get Followers")
    }
}
