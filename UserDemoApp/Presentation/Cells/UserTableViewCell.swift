import UIKit

class UserTableViewCell: UITableViewCell {
    
    let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let lblEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(lblName)
        contentView.addSubview(lblEmail)
        
        // Add constraints
        NSLayoutConstraint.activate([
            lblName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lblName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            lblEmail.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 5),
            lblEmail.leadingAnchor.constraint(equalTo: lblName.leadingAnchor),
            lblEmail.trailingAnchor.constraint(equalTo: lblName.trailingAnchor),
            lblEmail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with name: String, and email: String) {
        lblName.text = name
        lblEmail.text = email
    }
}
