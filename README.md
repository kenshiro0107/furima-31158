##usersテーブル

| Colum            | Type | Options    |
|------------------|------|------------|
|email             |string|null: false |
|encrypted_password|string|null: false |
|nick_name         |string|null: false |
|last_name         |string|null: false |
|first_name        |string|null: false |
|last_name(Kana)   |string|null: false |
|first_name(Kana)  |string|null: false |
|birthday_year     |string|null: false |
|birthday_month    |string|null: false |
|birthday_date     |string|null: false |

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
|delivery fee   |integer      |null: false      |
|shipment_source|integer      |null: false      |
|shipping_days  |integer      |null: false      |
|user           |references   |foreign_key: true|

###Association
- belongs_to: user
- has_one: oder

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