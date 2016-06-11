class User < ActiveRecord::Base
  # t.string :name
  # t.string :email
  # t.string :password_digest
  # t.integer :grado
  # t.string :vehiculo
  # t.string :region
  # t.string :comuna
  # t.string :direccion
  # t.float :latitude
  # t.float :longitude
  # t.string :fono
  # t.integer :grado
  has_secure_password
  geocoded_by :direccion   # can also be an IP address
  after_validation :geocode , if: ->(obj){ obj.direccion.present? and obj.direccion_changed? }         # auto-fetch coordinates
  validates :name, :email, :region, :comuna, :direccion, :fono, :password, presence: true
  before_create :generar_token
  validates :email, uniqueness: true

  private
    def generar_token
      begin
        self.token = SecureRandom.hex
      end while User.where(token: self.token).any?
    end


end
