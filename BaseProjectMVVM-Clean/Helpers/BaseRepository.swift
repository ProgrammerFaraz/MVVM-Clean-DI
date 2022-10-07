//
//  BaseRepository.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Foundation

class BaseRepository {
    
//    var networkAdapter : NetworkChangeNotifiable = NetworkChangeClass()
    
    /// A general method to show alert to user coming from API Request.
    ///
    /// - Parameters:
    ///   - failure: Server failure response.
    ///   - vc: on view controller which error has to be shown.
//    func switchFailure(_ failure: Failure, errorCompletion: @escaping (ServerErrorResponse?, String?) -> Void ) {
//
//        if let data = failure.data {
//            if let errorResponse = try? JSONDecoder().decode(ServerErrorResponse.self, from: data) {
//                errorCompletion(errorResponse, nil)
//                return
//            } else {
//                errorCompletion(nil, Messages.wentWrongError)
//            }
//        } else {
//            errorCompletion(nil, failure.message)
//        }
//    }
    
    /// A general method to show alert to user coming from API Request.
    ///
    /// - Parameters:
    ///   - failure: Server failure response.
    ///   - vc: on view controller which error has to be shown.
//    func switchPaymentFailure(_ failure: Failure, errorCompletion: @escaping (PaymentErrorResponse?, String?) -> Void ) {
//
//        if let data = failure.data {
//            if let errorResponse = try? JSONDecoder().decode(PaymentErrorResponse.self, from: data) {
//                errorCompletion(errorResponse, nil)
//                return
//            } else {
//                errorCompletion(nil, Messages.wentWrongError)
//            }
//        } else {
//            errorCompletion(nil, failure.message)
//        }
//    }
    
    
//    func switchRedeemFailure(_ failure: Failure, errorCompletion: @escaping (ServerErrorForRedeem?, String?) -> Void ) {
//
//           if let data = failure.data {
//               if let errorResponse = try? JSONDecoder().decode(ServerErrorForRedeem.self, from: data) {
//                   errorCompletion(errorResponse, nil)
//                   return
//               } else {
//                   errorCompletion(nil, Messages.wentWrongError)
//               }
//           } else {
//               errorCompletion(nil, failure.message)
//           }
//       }
//    func switchKycFailure(_ failure: Failure, errorCompletion: @escaping (ServerErrorForKyc?, String?) -> Void ) {
//
//        if let data = failure.data {
//            if let errorResponse = try? JSONDecoder().decode(ServerErrorForKyc.self, from: data) {
//                errorCompletion(errorResponse, nil)
//                return
//            } else {
//                errorCompletion(nil, Messages.wentWrongError)
//            }
//        } else {
//            errorCompletion(nil, failure.message)
//        }
//    }
    
}
