class PassportStatus < ApplicationRecord
    belongs_to :user

    validates :name, presence: true

#   corrigir depois enum quebrado
#    enum name: {
#        pending_payment: "Aguardando pagamento",
#        payment_confirmation: "Pagamento confirmado",
#        under_review: "Em análise documental",
#        in_production: "Em confecção",
#        ready_for_pickup: "Disponível para retirada",
#        delivered: "Retirado pelo titular",
#        canceled: "Cancelado"
#    }, _prefix: :status

#    enum status: [ :active, :archived ]
end
