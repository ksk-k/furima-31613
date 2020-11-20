usersテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| email              | string    | null: false |
| nickname           | string    | null: false |
| encrypted_password | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_kana          | string    | null: false |
| first_kana         | string    | null: false |
| birthday           | date      | null: false |

### Association
- has_many : items
- has_many : comments
- has_many : purchases


itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_many : users
- has_many : comments
- has_many : purchases

purchasesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- hes_one : deliveries


deliveriesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

commentsテーブル
| Column    | Type       | Options                        | 
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| purchase  | references | null: false, foreign_key: true |

### Association
- belongs_to :purchases


