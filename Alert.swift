
//  ViewController.swift
//  Alert controller
//
//  Created by mohamed on 2/15/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }


    @IBAction func b(_ sender: Any) {
        //عادة يتم استخدام الUIAlertController لعرض نافذة تحذيرية للمستخدم، تحتوي على رسالة وازرار لاتخاذ اجراءات بناء عليها.
      //  يمكن استخدامها أيضا لتمكين المستخدم من ادخال بيانات تسجيل دخول او حساب جديد، عرض بيانات للمستخدم، أو عرض المزيد من الاعدادات في نافذة خارجية.
        //هناك نوعين من الUIAlertController
        //1-1- Alert UIAlertController
        //2-2- ActionSheet UIAlertController
        //(لانشاء النوافذ المطلوبة، يمكنك تضمين جميع الأكواد القادمة في داخل IBAction او TableViewCell أو حتى في viewDidLoad لتقوم بتنفيذ الكود مباشرة)
        //- نافذة Alert تحتوي على TextField:
      //  أول نافذة تحذيرية سنقوم بانشائها، تحتوي على textfield واحد، بالاضافة الى زرين submit و cancel
        //في الثلاث أسطر الأولى، قمنا بانشاء UIAlertController، وحددنا عنوانه والرسالة المضمنة فيه، وحددنا نوعه ليكون alert.
       // تاليا قمنا بانشاء أول زر submitAction، وخصصنا عنوانه وستايله، وفي بلوك الhandler الأخير أضفنا الأوامر التي نرغب بتنفيذها عند الضغط على هذا الزر
      //  أخيرا قمنا بانشاء زر cancel بستايل destructive. ليكون أحمر اللون

        
        let alert = UIAlertController(title: "AlertController Tutorial",
                                      message: "Submit some text",
                                      preferredStyle: .alert)
        
        // Submit button
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            let textField = alert.textFields![0]
            print(textField.text!)
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        //الآن بقي لنا أن نضيف هذين الزرين الى النافذة التي أنشأناها أولا، ومن ثم نعرض النافذة للمستخدم.
     //   ولكن قبل هذا، لا ننسى أن ننشئ و نضيف الTextField الى النافذة، فنكمل باضافة الكود التالي:
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        
        //في الأسطر الأولى قمنا بانشاء وتخصيص واضافة الTextField في خطوة واحدة.     
      //  ثم أخيرا قمنا باضافة الزرين السابق انشاؤهما وقمنا بعرض الUIAlertController عن طريق استدعاء الميثود present
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func alert2(_ sender: Any) {
        
        //- نافذة ActionSheet تحتوي على عدة خيارات:
      //  بطريقة مشابهة جدا لنوافذ الAlert، سنقوم بانشاء نافذة ActionSheet. أولا سنقوم باضافة الكود التالي:
        let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Send", style: .default, handler: { (action) -> Void in
            print("Send button tapped")
        })
        
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            print("Delete button tapped")
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        //قمنا أولا بانشاء UIAlertController من نوع ActionSheet، ثم أنشأنا عدة أزرار بستايلات مختلفة وكل زر يحتوي على بلوك الactions الخاص به.
        
       // الآن سنضيف الأزرار الى الUIAlertController ومن ثم سنعرضها:
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
        //لاحظ أن ستايلات الأزرار تختلف بالشكل:
        //defaults. يعطيك شكل زر Send now الطبيعي
        //destructive. يضيف اللون الأحمر ويستعمل عادة لأوامر الحذف لتنبيه المستخدم
        //cancel. يعزل الزر عن باقي الأزرار ويستعمل عادة لزر الالغاء
        
    }
}
