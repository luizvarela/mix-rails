class VoucherUser
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name, type: String
    field :email, type: String
    field :confirmed, type: Boolean, default: false
    field :confirmation_date, type: Date

    belongs_to :voucher

    attr_protected :confirmed, :confirmation_date
    validates_presence_of :name, :email
    validates :email, email: true

    after_create :send_confirmation_email


    def confirm
        @confirmed = true
        @confirmation_date = Time.now
        @save
    end

    # @param voucher instance of Voucher
    def already_required(voucher)
        user = VoucherUser.where({voucher_id: voucher[:_id], _id: @attributes['_id']}).first
        if user
            true
        else
            false
        end
    end

    def has_confirmed(voucher)
        user = VoucherUser.where({voucher_id: voucher[:_id], _id: @attributes['_id'], confirmed: true}).first
        if user
            true
        else
            false
        end
    end

    def send_confirmation_email
        VoucherMailer.send_confirmation_link(self).deliver
    end

end
