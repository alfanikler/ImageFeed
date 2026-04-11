//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Alfa on 11.04.2026.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var userDescriptionLabel: UILabel!
    @IBOutlet private var userIdLabel: UILabel!
    @IBOutlet private var userNameLabel: UILabel!

    @IBOutlet private var logoutButton: UIButton!
    @IBOutlet private var userAvatarImageView: UIImageView!
    
    
    @IBAction private func didTapLogoutButton(_ sender: UIButton) {
        print("Exit")
    }
}
