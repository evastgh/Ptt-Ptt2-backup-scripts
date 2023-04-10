# Ptt-Ptt2-backup-scripts

## Ptt2 個版備份教學
* 首先，在個版內（必須是版主帳號）按 u 申請看板備份，輸入通知信箱（可以輸入一般 email address）
* 約一到兩天後，會收到一封來自 <帳號>.bbs@ptt2.cc 但是充滿亂碼的信，信中有一個連結，點開之後可以下載打包好的壓縮檔
* 解壓後會發現打包好的資料都是亂碼，因為 ptt 跟 ptt2 仍然使用 Big5 編碼！
* 可以使用這個 repository 裡的 `convert.zsh` 將 Big5 編碼的檔案轉檔成 UTF-8
* （可略過）如果想要把各個檔案的檔名也根據檔案內容中的標題跟時間進行轉碼，則可以使用這個 repository 裡的 `rename.zsh`

## Ptt / Ptt2 信箱備份教學
* 在 Ptt / Ptt2 信箱中用選項 (Z)ip UserHome 申請備份，輸入通知信箱（可以輸入一般 email address）
* 根據信箱大小，通常會馬上收到來自 bbs@ptt.cc （或 bbs@ptt2.cc）的信件，內附一個壓縮檔
* 解壓後會發現裡面有完整信箱裡的紀錄，但都是 Big5 編碼
* 使用這個 repository 裡的 `convert.zsh` 將 Big5 編碼的檔案轉成 UTF-8 
* （可略過）如果想要把各個檔案的檔名也根據檔案內容中的標題跟時間進行轉碼，則可以使用這個 repository 裡的 `rename.zsh`

## 執行 .zsh 檔案教學
* 將下載下來的 .zsh 檔放到解壓縮出來的資料夾
* 右鍵點選下載下來的 .zsh 檔案，複製檔案的路徑
* 打開 Terminal （終端機），輸入 `cd `（含空白），貼上剛剛複製的檔案路徑後按確定
* 輸入 `chmod 755 <下載下來的 .zsh 檔名>` （檔名是 `convert.zsh` 或 `rename.zsh`）後按確定，這一步會改變檔案的權限，將其變成可執行檔
* 輸入 `./<想執行的 .zsh 檔名>`（檔名是 `convert.zsh` 或 `rename.zsh`）後按確定執行
