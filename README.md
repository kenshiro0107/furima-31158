##usersテーブル

| Colum            | Type | Options    |
|------------------|------|------------|
|email             |string|null: false |
|encrypted_password|string|null: false |
|nick_name         |string|null: false |
|last_name         |string|null: false |
|first_name        |string|null: false |
|last_name_Kana    |string|null: false |
|first_name_Kana   |string|null: false |
|birth_date        |date  |null: false |

###Association
- has_many: items
- has_many: orders

##itemテーブル

| Colum            | Type        | Options         |
|------------------|-------------|-----------------|
|name              |sting        |null: false      |
|info              |text         |null: false      |
|price             |integer      |null: false      |
|category_id       |integer      |null: false      |
|status_id         |integer      |null: false      |
|delivery fee_id   |integer      |null: false      |
|prefectural_id    |integer      |null: false      |
|shipping_days_id  |integer      |null: false      |
|user              |references   |foreign_key: true|

###Association
- belongs_to: user
- has_one: order

##order

| Colum        | Type     | Options         |
|--------------|----------|-----------------|
|user          |references|foreign_key: true|
|item          |references|foreign_key: true|

###Association
- belongs_to: user
- belongs_to: item
- has_one: address

##address

| Colum        | Type     | Options         |
|--------------|----------|-----------------|
|postal_number |string    |null: false      |
|prefectural_id|integer   |null: false      |
|municipality  |string    |null: false      |
|address       |string    |null: false      |
|building_name |string    |                 |
|phone_number  |string    |null: false      |
|order         |references|foreign_key: true|

###Association
- belongs_to: order