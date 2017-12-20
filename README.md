## usersテーブル
|Column| Type|Options|
|------|-----|-------|
|name        |string|null: false, add_index :users, :name|
|birthday    |date|null: false
|address     |string|
|avatar      |string|
|facebook_url|string|
|summary     |text|
|gender      |string|
### association
has_many :telephones
has_many :careers
has_many :academies

## telephoneテーブル
|Column| Type|Options|
|------|-----|-------|
|num   |string   |
|user  |references| foreign_key: true
### association
belongs_to :user
belongs_to :telephone_type

## telephone_typeテーブル
|Column| Type|Options|
|------|-----|-------|
|telephone|references|
|name|string|
### association
has_many :telephones

## careerテーブル
|Column| Type|Options|
|------|-----|-------|
|department|string|
|position  |string|
|from      |date  |
|to        |date|
|user      |references| foreign_key: true
|company   |references| foreign_key: true
### association
belongs_to :user
belongs_to :company

## companyテーブル
|Column| Type|Options|
|------|-----|-------|
|name|string| null: false
|url |string|
### association
has_many :careers

## cardテーブル
|Column| Type|Options|
|------|-----|-------|
|image |string| null: false
|user  |references| foreign_key: true
|career|references| foreign_key: true
### association
belongs_to :user
belongs_to :career

## academyテーブル
|Column| Type|Options|
|------|-----|-------|
|school_type|string|
|name       |string|
|major      |string|
|degree     |string|
|from       |date|
|to         |date|
|user       |references| foreign_key: true
### association
belongs_to :user
