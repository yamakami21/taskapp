# railsのモデルの部分
class Project < ActiveRecord::Base
    # validarionを設定する
    # 値が空でないか(presence)を検証す。
    # :titleがからだったらダメ
    validates :title,
    presence: { message: "入力してください！"},
    length: {minimum: 3, message: "短すぎ"}
end
