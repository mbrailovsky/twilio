class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  validates :cvv, length: { is: 3 }
#  validates :cc_number, length: { is: 16 }
#  validates :email, :cc_number, :cc_exp_date, :presence => true

  validate :fields_presence
  validate :login_id_unique
  validate :email_format
  validate :cc_exp_date_format
  validate :password_complexity
  validate :cc_number_format
  validate :cvv_format

  def password_complexity
    if !password.present?
      if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
        errors.add :password, "complexity requirement not met"
        return false
      end
    end
  end

  def fields_presence
    if login_id.blank?
      errors.add :login_id, "is required"
    end
    if first_name.blank?
      errors.add :first_name, "is required"
    end
    if last_name.blank?
      errors.add :last_name, "is required"
    end
    if street_address.blank?
      errors.add :street_address, "is required"
    end
    if city.blank?
      errors.add :city, "is required"
    end
    if zip.blank?
      errors.add :zip, "is required"
    end
    if cc_number.blank?
      errors.add :cc_number, "is required"
    end
    if cc_exp_date.blank?
      errors.add :cc_exp_date, "is required"
    end
    if cvv.blank?
      errors.add :cvv, "is required"
    end
  end

  def login_id_unique
    if User.count > 0
      users = User.where("login_id = ?", login_id)
      if users.size > 0
        errors.add :login_id, "already taken"
      end
    end
  end

  def email_format
    if !email.blank?
      email_match = /^[\w]+@[\w]+\.[\w]+$/.match(email)
      if email_match.nil?
        errors.add :email, "Must contain one '@' and one period"
      end
    end
  end

  def cc_exp_date_format
    if !cc_exp_date.blank?
      cc_exp_date_match = /^\d{2}\/\d{4}$/.match(cc_exp_date)
      if cc_exp_date_match.nil?
         errors.add :cc_exp_date, "Must be in format of MM/YYYY"
      end
    end
  end

  def cc_number_format
    if !cc_number.blank?
      cc_number_match = /^\d{16}$/.match(cc_number.to_s)
      if cc_number_match.nil?
         errors.add :cc_number, "Must be have 16 digits"
      end
    end
  end

  def cvv_format
    #logger.error("cvv = #{cvv}")
    if !cvv.blank?
      cvv_match = /^\d{3}$/.match(cvv.to_s)
      if cvv_match.nil?
         errors.add :cvv, "Must be have 3 digits"
      end
    end
  end

end
