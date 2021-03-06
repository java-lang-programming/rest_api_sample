# 記事コメント取得

## 機能

記事に投稿されたコメントの一覧を取得する

## バージョン

api/v1/

## Method

GET

## URL

api/v1/articles/{:id}/comments

(例)
api/v1/articles/94/comments

## パラメーター

count 数 デフォルトは10　最大で30
since 記事投稿日付 article_commentsのcreated_at longにする。
since_id article_comments のid。前回の最後のID

##　コントローラー

Articles::CommentController#index

## 必要なテーブル
articles_comments (bundle exec rails g model article_comment article_id:integer user_id:integer comment:text deleted_at:timastamp ancestry:string)
reactions (bundle exec rails g model reaction kind:integer name:string deleted_at:timastamp)
users (bundle exec rails g model user nick_name:string profile_image:string gender:integer deleted_at:timastamp)

## json　サンプル

success

[{
		"created_at": "Thu Apr 06 15:28:43 +0000 2017",
		"id": 1,
		"text": "RT @TwitterDev: 1/ Today we’re sharing our vision for the future of the Twitter API platform!nhttps://t.co/XweGngmxlP",
		"truncated": false,
		"user": {
			"id": 2244994945,
			"nick_name": "TwitterDev",
			"url": "https://t.co/66w26cua1O",
			"truncated": false
		},
		"reactions": [{
			"favorite_count": 162,
			"favorited": false
		}, {
			"bad_count": 162,
			"favorited": false
		}],
		"children": [{}]
	},
	{
		"created_at": "Thu Apr 06 15:28:43 +0000 2017",
		"id": 1,
		"text": "RT @TwitterDev: 1/ Today we’re sharing our vision for the future of the Twitter API platform!nhttps://t.co/XweGngmxlP",
		"truncated": false,
		"user": {
			"id": 2244994945,
			"nick_name": "TwitterDev",
			"url": "https://t.co/66w26cua1O",
			"truncated": false
		},
		"reactions": [{
			"id": 2244994945,
			"nick_name": "TwitterDev",
			"url": "https://t.co/66w26cua1O",
			"truncated": false
		}],
		"children": [{}]
	}
]

success

データなし
{}


失敗

{
	"errors": [{
		"message": "Sorry, that page does not exist",
		"code": 34
	}]
}

key errorsがあるかないかで判断する。

## 設計思想

google API
https://cloud.google.com/apis/design/resource_names

ページング
https://qiita.com/marnie_ms4/items/1dc51042844c85c30550

エラー
https://qiita.com/suin/items/f7ac4de914e9f3f35884


* テスト
    * URI OK
    * Method(GET) OK
    * parameter
    * Sucess
    * failure
    * ページング同時日付の境界値
    * 最新の投稿がある場合の通知
