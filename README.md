# データベース設計計画書

## usersテーブル
|Column| Type|Options|
|------|-----|-------|
|name        |string|null: false, add_index :users, :name, unique: true|
|birthday    |date|
|address     |string|
|avatar      |string|
|facebook_url|string|
|summary     |text|
|gender      |string|
### association
has_many :telephones
has_many :careers
has_many :academys

## telephoneテーブル
|Column| Type|Options|
|------|-----|-------|
|num|integer   |
|telephone_type|references|
|user          |references|
### association
belongs_to :user
belongs_to :telephone_type

## telephone_typeテーブル
|Column| Type|Options|
|------|-----|-------|
|name|string|
### association
has_many :telephones

## careerテーブル
|Column| Type|Options|
|------|-----|-------|
|department|string|
|position  |string|
|user      |references|
|company   |references|
### association
belongs_to :user
belongs_to :company

## companyテーブル
|Column| Type|Options|
|------|-----|-------|
|name|string|
|url|string|
### association
has_many :careers

## academyテーブル
|Column| Type|Options|
|------|-----|-------|
|school_type|string|
|university|string|
|major     |string|
|degree    |string|
|duration  |date|
|user|references|
### association
belongs_to :user
