require 'mailgun' 

class HomeController < ApplicationController
    def index
    end
    def write
        
        new_post=Post.new
        new_post.tTitle = params[:Temail]
        new_post.fTitle = params[:Femail]
        new_post.subject = params[:subject]
        new_post.content = params[:content]
        
        new_post.save
        
        mg_client = Mailgun::Client.new("key-d66e15dc63011037c465823342f2381d")

        message_params =  {
                   from: new_post.fTitle,
                   to:   new_post.tTitle,
                   subject: new_post.subject,
                   text:    new_post.content
                    }

        result = mg_client.send_message('sandbox294dde793cf247589bbb4055781025bc.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
        redirect_to "/list"
        
    end
    def list
        
        @every_post = Post.all.order("id desc")
    end
    def destroy
        @one_post = Post.find(params[:post_id])
        @one_post.destroy
        redirect_to "/list"
    end
    def update_view
         @one_post = Post.find(params[:post_id])
    end
    def real_update
        @one_post = Post.find(params[:post_id])
        @one_post.tTitle = params[:Temail]
        @one_post.fTitle = params[:Femail]
        @one_post.subject = params[:subject]
        @one_post.content = params[:content]
        
        @one_post.save
        
        redirect_to "/list"
    end
    
end
