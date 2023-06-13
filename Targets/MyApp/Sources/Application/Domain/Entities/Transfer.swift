
import Foundation

// MARK: - Transfer
struct Transfer {
    let transfers: Transfers
}

// MARK: - Transfers
struct Transfers {
    let type: String
    let data: [TransfersDatum]
}

// MARK: - TransfersDatum
struct TransfersDatum {
    let name: String
    let playerID: Int
    let position: Position?
    let transferDate: String
    let transferText: [NSNull]
    let fromClub: String
    let fromClubID: Int
    let toClub: String
    let toClubID: Int
    let fee: Fee?
    let transferType: TransferType
    let contractExtension, onLoan: Bool
    let fromDate, toDate, marketValue: String
}

// MARK: - Fee
struct Fee {
    let feeText, localizedFeeText: String
    let value: String?
}

// MARK: - Position
struct Position {
    let label, key: String
}

// MARK: - TransferType
struct TransferType {
    let text, localizationKey: String
}
