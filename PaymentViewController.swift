//
//  PaymentViewController.swift
//  nk
//
//  Created by Валерий on 15.03.2021.
//

import UIKit
import PassKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    private var paymentRequest: PKPaymentRequest = {
            let request = PKPaymentRequest()
            request.merchantIdentifier = "merchant.com..."
            request.supportedNetworks = [.visa, .masterCard,.amex,.discover]
            request.supportedCountries = ["UA"]
            request.merchantCapabilities = .capability3DS
            request.countryCode = "UA"
            request.currencyCode = "UAH"
            request.paymentSummaryItems = [PKPaymentSummaryItem(label: "App test", amount: 10.99)]
            return request
        }()
    @IBAction func purchase(_ sender: Any?) {
            if let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest) {
                controller.delegate = self
                present(controller, animated: true, completion: nil)
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: PKPaymentAuthorizationViewControllerDelegate {
 
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
    }
 
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
 
}
