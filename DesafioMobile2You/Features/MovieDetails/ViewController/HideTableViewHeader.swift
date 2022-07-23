////
////  hideTableviewHeader.swift
////  DesafioMobile2You
////
////  Created by Marcelo Silva on 21/07/22.
////
//
//import Foundation
//import UIKit
//import AlamofireImage
//
//final class HideTableViewHeader: UIView{
//    
//    let viewModel: MovieViewModel?
//    
//    public let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "Image")
//        return imageView
//    }()
//    
//    private var imageViewHeight = NSLayoutConstraint()
//    private var imageViewBottom = NSLayoutConstraint()
//    private var containerView = UIView()
//    private var containerViewHeight = NSLayoutConstraint()
//    
//    // MARK: - Initializer
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addElements()
//        self.setupConstraints()
//        self.configHeaderImage(data: unrwrapMovieDetails())
//    }
//    
//    required init? (coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    // MARK: - Private Functions
//    
//    private func unrwrapMovieDetails() -> MovieDetails{
//        if let movieDetails = self.viewModel?.movieDetails{
//         return movieDetails
//        }
//    }
//    
//    private func configHeaderImage(data: MovieDetails){
//        let url = URL(string: data.posterPath ?? "") ?? URL(fileURLWithPath: "")
//        imageView.af.setImage(withURL: url)
//        
//    }
//    
//    private func addElements(){
//        self.addSubview(self.containerView)
//        self.containerView.addSubview(self.imageView)
//    }
//    
//    func setupConstraints(){
//        NSLayoutConstraint.activate([
//            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
//            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            self.heightAnchor.constraint (equalTo: containerView.heightAnchor)
//        ])
//        
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        containerView.widthAnchor.constraint(equalTo: self.imageView.widthAnchor).isActive = true
//        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
//        containerViewHeight.isActive = true
//        
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
//        imageViewBottom.isActive = true
//        imageViewHeight = imageView.heightAnchor.constraint(equalTo: self.containerView.heightAnchor)
//        imageViewHeight.isActive = true
//    }
//    
//    public func scrollViewDidScroll(scrollView: UIScrollView){
//        containerViewHeight.constant = scrollView.contentInset.top
//        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
//        containerView.clipsToBounds = offsetY <= 0
//        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
//        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
//    }
//}
