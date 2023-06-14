
import Foundation

// MARK: - Transfer
struct Transfer: Codable{
    let transfers: TransferData
}

// MARK: - Transfers
struct TransferData: Codable {
    let type: String
    let data: [TransferList]
}

// MARK: - TransfersDatum
struct TransferList: Codable {
    let name: String?
    let playerId: Int?
    let position: Position?
    let transferDate: String?
    let fromClub: String?
    let fromClubId: Int?
    let toClub: String?
    let toClubId: Int?
    let fee: Fee?
    let transferType: TransferType
    let contractExtension, onLoan: Bool?
    var fromDate, toDate, marketValue: String?
}

// MARK: - Fee
struct Fee: Codable {
    let feeText, localizedFeeText: String?
    let value: String?
}

// MARK: - Position
struct Position: Codable {
    let label, key: String?
}

// MARK: - TransferType
struct TransferType: Codable {
    let text, localizationKey: String?
}
