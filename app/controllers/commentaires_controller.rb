class CommentairesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if user_signed_in?
      params[:commentaire][:nom] = current_user
      params[:commentaire][:visible] = true
    end
    @commentaire = @post.commentaires.create!(params[:commentaire])
    redirect_to @post, :notice => "Votre commentaire a été enregistré"
  end
end
