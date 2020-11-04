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
|birth_date_id     |date  |null: false |

###Association
- has_many: items
- has_one: oder

##itemテーブル

| Colum         | Type        | Options         |
|---------------|-------------|-----------------|
|item_name      |sting        |null: false      |
|item_info      |text         |null: false      |
|price          |integer      |null: false      |
|category_id    |integer      |null: false      |
|status_id      |integer      |null: false      |
|user           |references   |foreign_key: true|

###Association
- belongs_to: user
- has_one: order
- has_one: delivery_info

##delivery_info
|delivery fee_id   |integer      |null: false      |
|shipment_source_id|integer      |null: false      |
|shipping_days_id  |integer      |null: false      |
|item              |references   |foreign_key: true|

###Association
- belong_to: item

##order

| Colum        | Type     | Options         |
|--------------|----------|-----------------|
|price         |integer   |null: false      |
|postal_number |string    |null: false      |
|prefectural_id|integer   |null: false      |
|municipality  |string    |null: false      |
|address       |string    |null: false      |
|building_name |string    |                 |
|phone_number  |string    |null: false      |
|user          |references|foreign_key: true|
|item          |references|foreign_key: true|

###Association
- belongs_to: user
- belongs_to: items