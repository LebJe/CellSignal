// Copyright 2018 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import CoreTelephony

class SignalStrength: NSObject {
	// From https://stackoverflow.com/a/62194028/12570844
    public func getSignalStrength() -> Int {
		let keyWindow = UIApplication.shared.connectedScenes
			.map({ $0 as? UIWindowScene })
			.compactMap({ $0 })
			.first?.windows.first
		
		if let statusBarManager = keyWindow?.windowScene?.statusBarManager,
			let localStatusBar = statusBarManager.value(forKey: "createLocalStatusBar") as? NSObject,
			let statusBar = localStatusBar.value(forKey: "statusBar") as? NSObject,
			let _statusBar = statusBar.value(forKey: "_statusBar") as? UIView,
			let currentData = _statusBar.value(forKey: "currentData")  as? NSObject,
			let cellular = currentData.value(forKey: "cellularEntry") as? NSObject,
			let signalStrength = cellular.value(forKey: "displayValue") as? Int {
			return signalStrength
		} else {
			return 0
		}
    }
}
