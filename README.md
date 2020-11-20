usersテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| encrypted_password | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_kana          | string    | null: false |
| first_kana         | string    | null: false |
| birthday           | date      | null: false |

### Association
- has_many : items
- has_many : comments
- has_one : deliveries
- has_one : purchases


itemsテーブル
| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| item_name          | string    | null: false |
| image              |           |             |
| text               | text      | null: false |
| category_id        | integer   | null: false |
| condition_id       | integer   | null: false |
| delivery_fee_id    | integer   | null: false |
| prefecture_id      | integer   | null: false |
| shipping_date_id   | integer   | null: false |
| price              | integer   | null: false |
| user               | reference | null: false |

### Association
- has_many : users
- has_many : comments
- has_one : purchases

purchasesテーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| user            | reference | null: false |
| item            | reference | null: false |

### Association
- belongs_to :users
- belongs_to :items


deliveriesテーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| postal_code     | string    | null: false |
| prefecture_id   | integer   | null: false |
| municipality    | string    | null: false |
| building_name   | string    | null: false |
| phone_number    | string    | null: false |
| user            | reference | null: false |
| item            | reference | null: false |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :purchases

commentsテーブル
| Column    | Type      | Options     | 
| --------- | --------- | ----------- |
| text      | text      | null: false |
| purchase  | reference | null: false |

### Association
- belongs_to :purchases


