class QnaController < ApplicationController
  def posts
	@posts = Post.all
  end

  def posts_category
    if params[:category] = "aaa"
      @category = "상품문의"
    elsif params[:category] = "bbb"
      @category = "주문/결제"
    elsif params[:category] = "ccc"
      @category = "배송관련"
    elsif params[:category] = "ddd"
      @category = "취소/환불"
    end
    @posts = Post.where(category: @category)
  end

  def show
    @post = Post.find(params[:id])
  end

  def write
  end

  def write_complete
    post = Post.new
    post.category = params[:post_category]
    post.title = params[:post_title]
    post.content = params[:post_content]
    if post.save
      flash[:alert] = "저장되었습니다."
      redirect_to "/qna/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end

  end

  def edit
   @post = Post.find(params[:id])
  end

  def edit_complete
    post = Post.find(params[:id])
    post.category = params[:post_category]
    post.title = params[:post_title]
    post.content = params[:post_content]
    if post.save
      flash[:alert] = "수정되었습니다."
      redirect_to "/qna/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def delete_complete
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "삭제되었습니다."
    redirect_to "/qna/posts"
  end
end
