# 🦖 ark-log-watcher

**ark-log-watcher** は、ARK: Survival Ascended のログファイルをリアルタイムで監視し、Discord に通知を送るツールです。

プレイヤーのチャット、接続・切断、死亡ログなどを Discord Webhook で即座に投稿できます。

---

## ✨ 特徴

- 🎯 任意のキーワードでログをフィルタ（例: `Chat:` や `joined` など）
- 🔔 Discord Webhook に即時通知
- ⚙️ YAML 設定だけで簡単導入
- 🛠 拡張性の高い Ruby 製スクリプト

---

## 📦 インストール

### 1. リポジトリをクローン & 依存をインストール

```bash
git clone https://github.com/YOUR_NAME/ark-log-watcher.git
cd ark-log-watcher
bundle install
```

### 2. 設定ファイルを編集

`config/config.yml` にログファイルのパスと Webhook URL を指定します。

```yaml
log_file: "/path/to/ShooterGame.log"
discord_webhook_url: "https://discord.com/api/webhooks/xxxx/yyyy"
filters:
  include:
    - "Chat:"
    - "joined"
    - "left"
    - "killed"
```

---

## 🚀 実行方法

```bash
ruby bin/ark_log_watcher
```

実行すると `.log` ファイルを監視し、マッチする行を Discord に送信します。

---

## 📂 ディレクトリ構成

```
ark-log-watcher/
├── bin/
│   └── ark_log_watcher        # 実行用ファイル（CLI）
├── lib/
│   └── ark_log_watcher.rb     # ログ監視ロジック
├── config/
│   └── config.yml             # 設定ファイル
├── Gemfile
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🛠 今後の予定

- [ ] Discord Embed による視認性向上
- [ ] ログファイルの自動切り替え対応（ShooterGame_YYYYMMDD.log など）
- [ ] systemd 対応で常時監視可能に
- [ ] Docker 対応

---

## 📜 ライセンス

MIT License  
Copyright (c) 2025

---

## 🙋‍♂️ コントリビュート歓迎！

バグ報告や機能要望、PR 大歓迎です。気軽に issue を立ててください。
