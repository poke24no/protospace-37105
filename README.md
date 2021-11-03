# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Colum           | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| title           | string    | null :false                   |
| catch_copy      | text      | null :false                   |
| concept         | text      | null :false                   |
| user            | references| null :false foreign_key: true |

### Association

- belongs_to :users
- has_many :comments

##  comments テーブル

| Colum           | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| content         | string    | null :false                   |
| prototype       | references| null :false foreign_key: true |
| user            | references| null :false foreign_key: true |

### Association

- belongs_to :users
- belongs_to :prototypes
