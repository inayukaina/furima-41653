# テーブル設計

## users　テーブル

| Column                | Type       | Options                   |
| --------------------- | ---------- | ------------------------- |
| nickname              | string     | null: false               |
| email                 | string     | null: false, unique: true |
| encrypted_password    | string     | null: false               |
| last_name             | string     | null: false               |
| first_name            | string     | null: false               |
| last_name_kana        | string     | null: false               |
| first_name_kana       | string     | null: false               |
| birth_date            | date       | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| name                  | string     | null: false                   |
| description           | text       | null: false                   |
| category              | integer    | null: false                   |
| item_condition        | integer    | null: false                   |
| shipping_cost_status  | integer    | null: false                   |
| shipping_origin_area  | integer    | null: false                   |
| shipping_schedule     | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order


##  orders テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user                  | references | null: false, foreign_key:true |
| item                  | references | null: false, foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresse


##  addresses テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| post_code             | string     | null: false                   |
| prefecture            | string     | null: false                   |
| city                  | string     | null: false                   |
| address               | string     | null: false                   |
| building              | string     |                               |
| phone_number          | string     | null: false                   |
| order                 | references | null: false, foreign_key:true |

### Association

- belongs_to :order