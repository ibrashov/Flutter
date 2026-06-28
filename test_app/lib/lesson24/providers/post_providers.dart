import 'package:flutter/material.dart';
import '../models/post.dart';
import '../repo/post_repo.dart';
class PostProvider extends ChangeNotifier{
    final PostRepo postRepo;
    PostProvider({required this.postRepo});
    List<Post> _posts =[];
    bool _isLoading = false;
    String _message = 'Press refresh to load posts';
    List<Post> get posts{
        return _posts;
    }
    bool get isLoading{
        return _isLoading;
    }
    String get message{
        return _message;
    }
    int get totalPosts{
        return _posts.length;
    }
    Future<void> loadPosts() async{
        _isLoading = true;
        _message = 'Loading posts...';
        notifyListeners();
        try{
            _posts = await postRepo.getPosts();
            _message = 'Posts loaded: ${_posts.length}';
        }catch(e){
            _message = 'Error: $e';
        }
        _isLoading = false;
        notifyListeners();
    }
    Future<void> createPost({
        required String title,
        required String body
    })async{
        _isLoading = true;
        _message = 'Creating post...';
        notifyListeners();
        try{
            final newPost = await postRepo.addPost(title: title, body: body);
            _posts.insert(0,newPost);
            _message = 'Post created';
        }catch(e){
            _message = 'Error: $e';
        }
        _isLoading = false;
        notifyListeners();
    }
    Future<void> deletedPost(int index)async{
        final post = _posts[index];
        _isLoading = true;
        _message = 'Delating post...';
        notifyListeners();
        try{
            await postRepo.removePost(post.id);
            _posts.removeAt(index);
            _message = 'Post deleted';
        }catch(e){
            _message = 'Error: $e';
        }
        _isLoading = false;
        notifyListeners();
    }
}