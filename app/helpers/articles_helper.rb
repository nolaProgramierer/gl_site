module ArticlesHelper
  #method to change comment background for every other comment
  def comment_list_bckgrd(count)
    if (count.odd?)
      bckgrd_color = "comment-list-wht"
    else
      bckgrd_color = "comment-list-offwht"
    end
    bckgrd_color
  end

  def show_no_comment
    if (@article.comments.any?)
      render 'comments'
    end
  end
end
