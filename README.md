# データベース設計

## usersテーブル

| Column             | Type    | Options                   | 
| ------------------ | ------- | ------------------------- | 
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               | 
| nickname           | string  | null: false               | 
| last_name          | string  | null: false               | 
| first_name         | string  | null: false               | 
| last_name_f        | string  | null: false               | 
| first_name_f       | string  | null: false               | 
| birthday           | date    | null: false               | 

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column             | Type          | Options                        | 
| ------------------ | ------------- | ------------------------------ | 
| name               | string        | null: false                    | 
| explanation        | text          | null: false                    | 
| category_id        | integer       | null: false                    | 
| state_id           | integer       | null: false                    | 
| delivery_cost_id   | integer       | null: false                    | 
| shipment_source_id | integer       | null: false                    | 
| shipping_day_id    | integer       | null: false                    | 
| selling_price      | integer       | null: false                    | 
| user               | references    | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column          | Type       | Options                        | 
| --------------- | ---------- | ------------------------------ | 
| user            | references | null: false, foreign_key: true | 
| item            | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル
| Column          | Type       | Options                        | 
| --------------- | ---------- | ------------------------------ | 
| postal_cord     | string     | null: false                    | 
| prefecture_id   | integer    | null: false                    | 
| municipality    | string     | null: false                    | 
| address         | string     | null: false                    | 
| building        | string     |                                | 
| phone_number    | string     | null: false                    | 
| purchase        | references | null: false, foreign_key: true | 


### Association
- belongs_to :purchase