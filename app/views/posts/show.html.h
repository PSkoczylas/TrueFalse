%p#notice= notice

%p
  %b Body:
  = @post.body
%p
  %b Comment:
  = @post.comment
%p
  %b Link:
  = @post.link
%p
  %b Rate:
  = @post.rate
%p
  %b Count favourite:
  = @post.count_favourite

= link_to 'Edit', edit_post_path(@post)
\|
= link_to 'Back', posts_path
