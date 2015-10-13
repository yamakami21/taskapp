class ProjectsController < ApplicationController
# コントローラー作成コマンドの際に生成される。
# コントローラとビューの対応するものを作っていく１


    def index
        # @をつけた変数はviewの中でそのまま使うことがでできる。
        # projectsのすべてを引っ張ってくる。
        # データベースに入っているもののすべてを引っ張ってくる。
        # データベースの中身の確認は、
        # rails dbのselect * from projects;で確認することができる


        @projects = Project.all
    end

    def show
    	@project = Project.find(params[:id])
    end

    def new
    	@project = Project.new
    end

    # POSTのとき
    # 送信ボタンなど何か情報送るときに使われるアクション
    # createしたものを保存する
    def create
        @project = Project.new(project_params)
        # もしセーブすることができれば、projectに行き、
        if @project.save
            redirect_to projects_path
            # もし値がなく、セーブすることができなければ、validatesのpresenceがtrueだったら、
        else
            render 'new'
        end
    end

    # 決まり文句的なもの
    # プライベート関数にする、外部から呼び出すことができない。
    # 昔はこのようにしていなかったようであるが、セキュリティ上このようにするらしい
    # ここでフィルタリングして渡すというのが最近の手法らしい
    private
        def project_params
            params[:project].permit(:title)
        end
end
