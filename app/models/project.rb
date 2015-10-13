# railsのモデルの部分
class Project < ActiveRecord::Base
    # validarionを設定する
    # 値が空でないか(presence)を検証する。
    validates :title, presence: true
end
