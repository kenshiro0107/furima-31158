##usersテーブル

| Colum     | Type  | Options    |
|-----------|-------|------------|
|email      |string |null: false |
|password   |string |null: false |
|nick_name  |string |null: false |
|name       |string |null: false |
|birthday_id|integer|null: false |

###Association
- has_many: items
- has_one: oder

##itemテーブル

| Colum       | Type        | Options         |
|-------------|-------------|-----------------|
|item_name    |sting        |null: false      |
|item_info    |text         |null: false      |
|item_img     |ActiveStorage|null: false      |
|price        |string       |null: false      |
|category_id  |integer      |null: false      |
|status_id    |integer      |null: false      |
|user         |references   |foreign_key: true|

###Association
- belongs_to: user
- has_one: delivery

##delivery

| Colum         | Type  | Options    |
|---------------|-------|------------|
|delivery fee   |integer|null: false |
|shipment_source|integer|null: false |
|shipping_days  |integer|null: false |

###Association
- belongs_to: delivery
- has_many: oder

##order

| Colum        | Type  | Options    |
|--------------|-------|------------|
|price         |integer|null: false |
|postal_number |string |null: false |
|prefectural_id|integer|null: false |
|municipality  |string |null: false |
|address       |string |null: false |
|building_name |string |            |
|phone_number  |string |null: false |

###Association
- belongs_to: delivery
- belongs_to: user