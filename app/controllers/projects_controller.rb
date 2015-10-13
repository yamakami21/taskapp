class ProjectsController < ApplicationController
# コントローラー作成コマンドの際に生成される。
# コントローラとビューの対応するものを作っていく１


# コントローラのアクションの中で共通なものをまとめる機能がある。
# そのアクションの前
# after_actionのようなものもある。
before_action :set_project, only: [:show, :edit, :update, :destroy]


    def index
        # @をつけた変数はviewの中でそのまま使うことがでできる。
        # projectsのすべてを引っ張ってくる。
        # データベースに入っているもののすべてを引っ張ってくる。
        # データベースの中身の確認は、
        # rails dbのselect * from projects;で確認することができる


        @projects = Project.all
    end
    # *******************************************
    def show
        # コントローラでparams[:]で取ることができる。
    	# @project = Project.find(params[:id])
    end

    # *******************************************
    # new,createはどちらかが書けることはできない
    def new
        # 新しいProjectインスタンスを設定する。
    	@project = Project.new
    end

    # POSTのとき
    # 送信ボタンなど何か情報送るときに使われるアクション
    # createしたものを保存する
    def create
        # フォームで入力されたものを入れてあげる必要がある。
        @project = Project.new(project_params)
        # 保存するときにValidationが発動する。
        # もしセーブすることができれば、projectに行く
        if @project.save
            redirect_to projects_path
        else
            # もし値がなく、セーブすることができなければ、validatesのpresenceがtrueだったら
            render 'new'
        end
    end

    # *******************************************
    # edit,updateはどちらかが書けることはできない
    def edit
        # コントローラーでは対象となるデータを参照するだけなのかもしれない。
        # @project = Project.find(params[:id])
    end
    def update
        # @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to projects_path
        else
            render 'edit'
        end

    end
    # *******************************************

    def destroy
        # @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    private
        # 決まり文句的なもの（代表的な手法）ー＞入力情報を管理する
        # プライベート関数にする、外部から呼び出すことができない。
        # 昔はこのようにしていなかったようであるが、セキュリティ上このようにするらしい
        # ここでフィルタリングして渡すというのが最近の手法らしい
        def project_params
            # 色々情報がる待っているparams[:project]の中の:titleだけを取る。
            params[:project].permit(:title)
        end

        # 他のスクリプトで使わないので
        def set_project
            @project = Project.find(params[:id])
        end
end
