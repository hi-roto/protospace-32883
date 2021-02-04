# テーブル設計
## users　テーブル

| Column     | Type   | Option      |
|------------|--------|-------------|
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | nell: false |

### Association
- has_many :comments
- has_many :prototypes

## comments テーブル

| Column    | Type      | Option      |
|-----------|-----------|-------------|
| text      | text      | null: false |
| user      | reference |             |
| prototype | reference |             |

### Association
- belongs_to :users
- belongs_to :prototypes

## prototypesテーブル

| Column     | Type          | Option      |
|------------|---------------|-------------|
| title      | string        | null: false |
| catch_copy | text          | null: false |
| concept    | text          | null: false |
| image      | ActiveStorage |             |
| user       | reference     |             |

### Association
- belongs_to :users
- has_many :comments
