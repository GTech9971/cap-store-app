# cap-store-app

電子部品管理アプリ

## プロジェクト作成

目的は、UI用のプロジェクトと、ロジックのみのプロジェクトを分離し、
UIプロジェクトからロジックプロジェクトを呼び出せるようにすること。

### 環境

- macOS Sonoma14.3
- Xcode 15.2

### UIプロジェクト作成

![Alt text](<000.png>)

Xcodeを開き、`Create New Project`を押す

![Alt text](001.png)

タブは`macOS`を選択し、グループ`Application`の`App`を選択して`Next`ボタンを押す

![Alt text](002.png)

`ProductName`にアプリ名を入力し、`Next`ボタンを押す

![Alt text](003.png)

フォルダ作成先ダイアログが表示されるので作成先を選んで`Create`ボタンを押す

![Alt text](004.png)

UI用プロジェクトが立ち上がる

### ロジックプロジェクト作成

![Alt text](005.png)

`File`の`New`の`Project...`をクリックする

![Alt text](006.png)

タブは`macOS`を選択し、グループの`Framework & Library`の`Framework`を選択して`Next`ボタンを押す

![Alt text](007.png)

`Product Name`にロジック用プロジェクト名を入力し、`Next`ボタンを押す

![Alt text](008.png)
フォルダ作成先ダイアログが表示される。デフォルトでは`Add to:`が`Don't add to any project or workspace`になっているので変更する

![Alt text](009.png)
`Add to:`をUI用プロジェクトに変更すると`Group:`も一緒に変更される

![Alt text](010.png)
するとUI用プロジェクトにロジック用プロジェクトがサブプロジェクトとして追加されたのが左のツリーメニューからわかる

### ロジック用プロジェクトにプログラム追加

![Alt text](011.png)

ロジック用プロジェクトのフォルダを右クリックして`New File...`を押す

![Alt text](012.png)

タブの`macOS`のグループ`Source`の`Swift File`を選択し`Next`ボタンを押す

![Alt text](013.png)
プログラム名を入力する。`Targets`はデフォルトのままで良い

![Alt text](014.png)

試しに以下のプログラムを追加した

```swift:Maker.swift
import Foundation

public struct Maker{
    public let name : String;
    
    public init(name: String) {
        self.name = name
    }
}
```

### UIプロジェクトからロジックプロジェクトのプログラムをテスト

![Alt text](015.png)

UIプロジェクトの`CapStoreTest.swift`からDomainsプロジェクトのMakerをテストする
UIプロジェクトを選択し`Generals`の`TARGETS`の`CapStoreTests`を選択し、画面下部の`Frameworks and Libraries`の`+`ボタンを押す

![Alt text](016.png)

ロジック用プロジェクトの`Domains.framework`を選択し、`Add`ボタンを押す

![Alt text](017.png)

`Frameworks and Libraries`に`Domains.framework`が追加された

![Alt text](018.png)
UIプロジェクトのテストコードでロジックプロジェクトのMakerを使用したテストを行う

`import Domains`でロジック用プロジェクトをインポートしている

```swift:CapStoreTests.swift
import XCTest
import Domains

@testable import CapStore

final class CapStoreTests: XCTestCase {

    func testExample() throws {
        let name : String = "test";
        let maker = Maker(name: name);
        XCTAssertEqual(name, maker.name);
    }
}
```

### UIプロジェクトでロジックプロジェクトのプログラムを使用

![Alt text](019.png)

この場合は`import Domains`と書くだけでロジック用プロジェクトのプログラムを使用できる

### フォルダ構成

![Alt text](020.png)

フォルダ構成はこのようになっている

### ロジック用プロジェクト単体で実行

![Alt text](021.png)

ロジック用プロジェクトの`.xcodeproj`ファイルを開く

![Alt text](022.png)

ロジック用プロジェクト単体でビルド、テストが可能

![Alt text](023.png)

ロジック用プロジェクトのテストコード
