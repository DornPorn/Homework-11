//
//  ViewController.swift
//  Homework 11
//
//  Created by Stanislav Rassolenko on 5/18/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    
    private lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.mainStackViewSpacing
        return stackView
        
    }()
    
    private lazy var firstProfileStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = Metric.firstProfileStackViewSpacing
        stackView.distribution = .fill
        return stackView
        
    }()
    
    private lazy var nameAndStatusStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        return stackView
        
    }()
    
    private lazy var onlineStatusStackView: UIStackView = {
        
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        return stackView
        
    }()
    
    private lazy var profileImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: Strings.profileImageName)
        image.layer.cornerRadius = Metric.profileImageHeight / 2
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.widthAnchor.constraint(equalToConstant: Metric.profileImageHeight).isActive = true
        return image
        
    }()
    
    private lazy var profileName = createLabel(with: Strings.profileName, fontSize: Metric.profileNameFontSize, fontWeight: .semibold, textColor: .white)
    private lazy var profileStatus = createLabel(with: Strings.profileStatus, fontSize: Metric.profileStatusFontSize, fontWeight: .regular, textColor: .systemCyan)
    private lazy var onlineStatusLabel = createLabel(with: Strings.onlineStatus, fontSize: Metric.profileStatusFontSize, fontWeight: .regular, textColor: .gray)
    
    private lazy var onlineStatusImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Strings.onlineStatusImageName)
        return imageView
        
    }()
    
    private lazy var editButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle(Strings.editButtonTitle, for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Metric.editButtonCornerRadius
        button.clipsToBounds = true
        return button
        
    }()
    
    private lazy var profileButtonsStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
        
    }()
    
    private lazy var storyButtonStack = createButtonStack()
    private lazy var noteButtonStack = createButtonStack()
    private lazy var photoButtonStack = createButtonStack()
    private lazy var clipButtonStack = createButtonStack()
    
    private lazy var storyButton = createButton(with: Strings.storyButtonImage)
    private lazy var noteButton = createButton(with: Strings.noteButtonImage)
    private lazy var photoButton = createButton(with: Strings.photoButtonImage)
    private lazy var clipButton = createButton(with: Strings.clipButtonImage)
    
    private lazy var storyLabel = createLabel(with: Strings.storyLabel, fontSize: Metric.profileButtonLabelFontSize, fontWeight: .regular, textColor: .systemCyan)
    private lazy var noteLabel = createLabel(with: Strings.noteLabel, fontSize: Metric.profileButtonLabelFontSize, fontWeight: .regular, textColor: .systemCyan)
    private lazy var photoLabel = createLabel(with: Strings.photoLabel, fontSize: Metric.profileButtonLabelFontSize, fontWeight: .regular, textColor: .systemCyan)
    private lazy var clipLabel = createLabel(with: Strings.clipLabel, fontSize: Metric.profileButtonLabelFontSize, fontWeight: .regular, textColor: .systemCyan)
    
    private lazy var profileInfoStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.profileInfoStackSpacing
        return stackView
        
    }()
    
    private lazy var cityStack = createHorizontalStackView()
    private lazy var subscribersStack = createHorizontalStackView()
    private lazy var workplaceStack = createHorizontalStackView()
    private lazy var giftStack = createHorizontalStackView()
    private lazy var moreInfoStack = createHorizontalStackView()
    
    private lazy var cityImage = createImageView(with: Strings.cityImage, color: .darkGray)
    private lazy var subsImage = createImageView(with: Strings.subsImage, color: .darkGray)
    private lazy var workplaceImage = createImageView(with: Strings.workplaceImage, color: .systemCyan)
    private lazy var giftImage = createImageView(with: Strings.giftImage, color: .systemPurple)
    private lazy var moreInfoImage = createImageView(with: Strings.moreInfoImage, color: .white)
    
    private lazy var cityLabel = createLabel(with: Strings.cityLabelText, fontSize: Metric.profileInfoFontSize, fontWeight: .regular, textColor: .darkGray)
    private lazy var subsLabel = createLabel(with: Strings.subsLabelText, fontSize: Metric.profileInfoFontSize, fontWeight: .regular, textColor: .darkGray)
    private lazy var workplaceLabel = createLabel(with: Strings.workplaceLabelText, fontSize: Metric.profileInfoFontSize, fontWeight: .regular, textColor: .systemCyan)
    private lazy var giftLabel = createLabel(with: Strings.giftLabelText, fontSize: Metric.profileInfoFontSize, fontWeight: .regular, textColor: .systemPurple)
    private lazy var moreInfoLabel = createLabel(with: Strings.moreInfoLabelText, fontSize: Metric.profileInfoFontSize, fontWeight: .regular, textColor: .white)
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(firstProfileStackView)
        firstProfileStackView.addArrangedSubview(profileImage)
        firstProfileStackView.addArrangedSubview(nameAndStatusStackView)
        nameAndStatusStackView.addArrangedSubview(profileName)
        nameAndStatusStackView.addArrangedSubview(profileStatus)
        nameAndStatusStackView.addArrangedSubview(onlineStatusStackView)
        onlineStatusStackView.addArrangedSubview(onlineStatusLabel)
        onlineStatusStackView.addArrangedSubview(onlineStatusImageView)
        mainStackView.addArrangedSubview(editButton)
        mainStackView.addArrangedSubview(profileButtonsStackView)
        profileButtonsStackView.addArrangedSubview(storyButtonStack)
        storyButtonStack.addArrangedSubview(storyButton)
        storyButtonStack.addArrangedSubview(storyLabel)
        profileButtonsStackView.addArrangedSubview(noteButtonStack)
        noteButtonStack.addArrangedSubview(noteButton)
        noteButtonStack.addArrangedSubview(noteLabel)
        profileButtonsStackView.addArrangedSubview(photoButtonStack)
        photoButtonStack.addArrangedSubview(photoButton)
        photoButtonStack.addArrangedSubview(photoLabel)
        profileButtonsStackView.addArrangedSubview(clipButtonStack)
        clipButtonStack.addArrangedSubview(clipButton)
        clipButtonStack.addArrangedSubview(clipLabel)
        mainStackView.addArrangedSubview(profileInfoStack)
        profileInfoStack.addArrangedSubview(cityStack)
        profileInfoStack.addArrangedSubview(subscribersStack)
        profileInfoStack.addArrangedSubview(workplaceStack)
        profileInfoStack.addArrangedSubview(giftStack)
        profileInfoStack.addArrangedSubview(moreInfoStack)
        cityStack.addArrangedSubview(cityImage)
        cityStack.addArrangedSubview(cityLabel)
        subscribersStack.addArrangedSubview(subsImage)
        subscribersStack.addArrangedSubview(subsLabel)
        workplaceStack.addArrangedSubview(workplaceImage)
        workplaceStack.addArrangedSubview(workplaceLabel)
        giftStack.addArrangedSubview(giftImage)
        giftStack.addArrangedSubview(giftLabel)
        moreInfoStack.addArrangedSubview(moreInfoImage)
        moreInfoStack.addArrangedSubview(moreInfoLabel)
        
    }
    
    private func setupLayout() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metric.mainConstraintOffset).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.mainConstraintOffset).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Metric.mainConstraintOffset).isActive = true
        
        firstProfileStackView.heightAnchor.constraint(equalToConstant: Metric.profileImageHeight).isActive = true

        nameAndStatusStackView.topAnchor.constraint(equalTo: firstProfileStackView.topAnchor, constant: Metric.nameAndStatusConstraintOffset).isActive = true
        nameAndStatusStackView.bottomAnchor.constraint(equalTo: firstProfileStackView.bottomAnchor, constant: -Metric.nameAndStatusConstraintOffset).isActive = true
        
        profileButtonsStackView.heightAnchor.constraint(equalToConstant: Metric.buttonStackheight).isActive = true
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    // MARK: - Private functions
    
    private func createLabel(with text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        return label
        
    }
    
    private func createButtonStack() -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Metric.buttonStackSpacing
        return stackView
        
    }
    
    private func createButton(with image: String) -> UIButton {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = .systemCyan
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.heightAnchor.constraint(equalToConstant: Metric.buttonStackheight / 2.5).isActive = true
        button.widthAnchor.constraint(equalToConstant: Metric.buttonStackheight / 2).isActive = true
        return button
        
    }
    
    private func createHorizontalStackView() -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
        
    }
    
    private func createImageView(with name: String, color: UIColor) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: name)
        imageView.tintColor = color
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        return imageView
        
    }
}

// MARK: - Constants

extension ViewController {
    enum Metric {
        static let profileImageHeight: CGFloat = 80
        static let firstProfileStackViewSpacing: CGFloat = 10
        static let mainStackViewSpacing: CGFloat = 10
        static let profileNameFontSize: CGFloat = 20
        static let profileStatusFontSize: CGFloat = 14
        static let editButtonCornerRadius: CGFloat = 8
        static let buttonStackheight: CGFloat = 70
        static let buttonStackSpacing: CGFloat = 5
        static let profileButtonLabelFontSize: CGFloat = 14
        static let profileInfoStackSpacing: CGFloat = 10
        static let profileInfoFontSize: CGFloat = 16
        static let mainConstraintOffset: CGFloat = 10
        static let nameAndStatusConstraintOffset: CGFloat = 5
    }
    
    enum Strings {
        static let profileName: String = "Stanislav Rassolenko"
        static let profileStatus: String = "Set status"
        static let onlineStatus: String = "online"
        static let editButtonTitle: String = "Edit"
        static let storyLabel: String = "Story"
        static let noteLabel: String = "Note"
        static let photoLabel: String = "Photo"
        static let clipLabel: String = "Clip"
        static let profileImageName: String = "profileImage"
        static let onlineStatusImageName: String = "iphone"
        static let storyButtonImage: String = "camera"
        static let noteButtonImage: String = "square.and.pencil"
        static let photoButtonImage: String = "photo"
        static let clipButtonImage: String = "video.square"
        static let cityImage: String = "house"
        static let subsImage: String = "dot.radiowaves.up.forward"
        static let workplaceImage: String = "suitcase"
        static let giftImage: String = "snowflake"
        static let moreInfoImage: String = "info.circle.fill"
        static let cityLabelText: String = "City: Bangkok"
        static let subsLabelText: String = "35 subscribers"
        static let workplaceLabelText: String = "Set up workplace"
        static let giftLabelText: String = "Get a gift >"
        static let moreInfoLabelText: String = "More information"
    }
}

