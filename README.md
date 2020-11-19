usersテーブル

| Column   | Type   | Options  |
| -------- | ------ | -------- |
| email    | string | not null |
| nickname | string | not null |
| password | string | not null |


itemsテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| item_name       | string    | not null |
| image           |           |          |
| text            | text      | not null |
| category        |           | not null |
| condition       |           | not null |
| delivery_fee    |           | not null |
| shipment_source |           | not null |
| shipping_date   |           | not null |
| price           | text      | not null |
| user            | reference | not null |


profilesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| name            |   text    | not null |
| kana_name       |           | not null |
| birthday        |           | not null |
| user            | reference | not null |

purchasesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| card            | text      | not null |
| expiration_data | text      | not null |
| security_code   | text      | not null |
| user            | reference | not null |
| item            | reference | not null |

deliveriesテーブル
| Column          | Type      | Options  |
| --------------- | --------- | -------- |
| postal_code     |           | not null |
| prefectures     |           | not null |
| municipality    |           | not null |
| building_name   | text      | not null |
| phone_number    | text      | not null |
| user            | reference | not null |
| item            | reference | not null |


commentsテーブル
| Column    | Type      | Options  | 
| --------- | --------- | -------- |
| text      | text      | not null |
| user      | reference |          |
| item      | reference | not null |

### Association