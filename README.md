usersテーブル

| Column   | Type   | Options  |
| -------- | ------ | -------- |
| email    | string | not null |
| nickname | string | not null |
| password | string | not null |

### Association
- has_many : items
- has_many : profiles
- has_many : comments
- has_one : deliveries
- has_one : purchases

itemsテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| item_name       | string    | not null |
| image           |           |          |
| text            | text      | not null |
| category        | integer   | not null |
| condition       | integer   | not null |
| delivery_fee    | integer   | not null |
| shipment_source | integer   | not null |
| shipping_date   | integer   | not null |
| price           | integer   | not null |
| user            | reference | not null |

### Association
- has_many : users
- has_many : comments
- has_one : purchases

profilesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| last_name       | string    | not null |
| first_name      | string    | not null |
| last_kana       | string    | not null |
| first_kana      | string    | not null |
| birthday        | integer   | not null |
| user            | reference | not null |

### Association
- belongs_to :user
- belongs_to :item
- has_one : deliveries


purchasesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| user            | reference | not null |
| item            | reference | not null |

### Association
- belongs_to :user
- belongs_to :item


deliveriesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| postal_code     | string    | not null |
| prefectures     | integer   | not null |
| municipality    | string    | not null |
| building_name   | string    | not null |
| phone_number    | string    | not null |
| user            | reference | not null |
| item            | reference | not null |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchases

commentsテーブル
| Column    | Type      | Options  | 
| --------- | --------- | -------- |
| text      | text      | not null |
| user      | reference | not null |
| item      | reference | not null |

### Association
- belongs_to :user
- belongs_to :item