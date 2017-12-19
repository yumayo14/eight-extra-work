# データベース設計計画書

## usersテーブル
|Column| Type|Options|
|------|-----|-------|
|name        |string |null: false, add_index :users, :name, unique: true|
|birthday    |
|address     |
|avatar      |
|facebook_url|
|summary     |
|gender      |

## telephoneテーブル
|Column| Type|Options|
|------|-----|-------|
|telephone_num |integer   |
|telephone_type|references|
|user          |references

## telehone_typeテーブル
|Column| Type|Options|
|------|-----|-------|
|cellphone|
|fixedphone|
|FAX|
|telephone|references|

## carrerテーブル
|Column| Type|Options|
|------|-----|-------|
|department|
|position  |
|user      |references|
|company   |references|

## companyテーブル
|Column| Type|Options|
|------|-----|-------|
|company_name|
|company_url |

## academyテーブル
|Column| Type|Options|
|------|-----|-------|
|school_type|
|university|
|major     |
|degree    |
|duration  |



<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->
