//
//  ViewController.swift
//  ImageFeed
//
//  Created by Alfa on 26.03.2026.
//

import UIKit

// MARK: - ImagesListViewController

final class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = (0..<20).map { "\($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard
            let photoName = photosName[safe: indexPath.row],
            let image = UIImage(named: photoName)
        else {
            return
        }
        
        let viewModel = ImagesListCellViewModel(
            image: image,
            isLiked: indexPath.row % 2 == 0,
            date: Date()
        )
        
        cell.configure(viewModel: viewModel)
    }

    private func configureTableView() {
        tableView.rowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
}

// MARK: - UITableViewDataSource

extension ImagesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imagesListCell = cell as? ImagesListCell else {
            assertionFailure("Failed to cast cell to \(ImagesListCell.self)")
            return UITableViewCell()
        }
        
        configureCell(for: imagesListCell, with: indexPath)
        
        return imagesListCell
    }
    
}

// MARK: - UITableViewDelegate

extension ImagesListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let photoName = photosName[safe: indexPath.row],
            let image = UIImage(named: photoName)
        else {
            return 200
        }
        
        let margins = (
            v: ImagesListCell.cellMargins.v * 2,
            h: ImagesListCell.cellMargins.h * 2,
        )

        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let imageViewWidth = tableView.bounds.width - margins.h
        
        return imageHeight / imageWidth * imageViewWidth + margins.v
    }

}
