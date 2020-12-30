# データベース設計

## usersテーブル

| Column   | Type    | Options     | 
| -------- | ------- | ----------- | 
| email    | string  | null: false | 
| password | string  | null: false | 
| nickname | string  | null: false | 
| name     | string  | null: false | 
| birthday | integer | null: false | 

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column          | Type          | Options                        | 
| --------------- | ------------- | ------------------------------ | 
| item_image      | ActiveStorage | null: false                    | 
| item_name       | string        | null: false                    | 
| explanation     | text          | null: false                    | 
| category        | ActiveHash    | null: false                    | 
| state           | ActiveHash    | null: false                    | 
| delivery_cost   | boolean       | null: false                    | 
| shipment_source | string        | null: false                    | 
| shipping_days   | integer       | null: false                    | 
| selling_price   | integer       | null: false                    | 
| user            | references    | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column          | Type       | Options                        | 
| --------------- | ---------- | ------------------------------ | 
| card_number     | integer    | null: false                    | 
| expiration_date | integer    | null: false                    | 
| svc             | integer    | null: false                    | 
| postal_cord     | integer    | null: false                    | 
| prefecture      | ActiveHash | null: false                    | 
| municipality    | string     | null: false                    | 
| address         | string     | null: false                    | 
| building        | string     |                                | 
| phone_number    | integer    | null: false                    | 
| user            | references | null: false, foreign_key: true | 
| item            | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item