<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tagline-upper text-center text-heading text-shadow text-white d-none d-lg-block"
	style="background-color: #ffffff; padding-top: 0px; border-bottom: solid 1px #cecece; background: url('resources/img/withtogether_logo.jpg'); height: 300px; margin-top:-20px">
	<a href="togetherdog.do?pageNo=1"><img src="resources/img/logo_with_white.png" style="width: 400px; margin-top: 45px;margin-right:450px; margin-bottom: 5px;"></a>
</div>

<div class="container">
	<img src="resources/img/donation2.png" style="margin-top: 0px; margin-left: 5px; height:110px">
	<a href="donationWrite.do" class="btn btn-danger" style="border:1px solid #ffaf26; background:#ffaf26;height: 110px; font-size: 15px; margin-top: 8px; margin-bottom: 8px; padding-top: 43px; cursor: pointer">
	모금함 개설하기 </a>
</div>
<div class="container donationPostList" id="container">

	<!-- for -->
	<c:forEach items="${donationList}" var="donation"  >
		<div class="item block" data-bgimage="resources/img/images/1.jpg">
			<div class="thumbs-wrapper" style="cursor: pointer">
				<div class="thumbs">
					<c:forEach items="${donation.imgPathList}" var="img">
						<img src="${pageContext.request.contextPath}/resources/upload/${img.imgPath}" style="width: 260px; height: 173px"/>
					</c:forEach>
					<a href="donationDetail.do?boardNo=${donation.boardNo}" class="btn btn-success" style="position:absolute; top:130px; z-index:999; left:0px; font-size: 13px; width: 220px; margin-left: 20px; margin-right: 20px">모금함 상세보기</a>
				</div>
			</div>
			<h2 class="title">&nbsp;</h2>
			<div class="intro" style="margin-top: 10px;overflow:hidden;word-wrap:break-word;">
				<c:if test="${donation.categoryNo == 30 }">
					<font style="float: left; font-size: 14px"><b>[진행중] ${donation.title}</b></font> 
				</c:if>
				<c:if test="${donation.categoryNo == 31 }">
					<font style="float: left; font-size: 14px"><b>[마감] ${donation.title}</b></font> 
				</c:if>
				<font style="float: left; font-size: 10px; color: #6b6b6b; margin-top: 4px; margin-left: 5px"><b>${donation.donationOrg}</b></font><br><br>
				<hr style="margin-top: 0px">
				<b>소개</b><br>
				${donation.intro}<br><br>
				<b>모금 목표액</b><br>
				${donation.dreamMoneyStr}원<br>
			</div>
		</div>
	</c:forEach>
</div>


<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="resources/script/js/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="resources/script/js/jquery.easing.1.3.js"></script>
<!-- the jScrollPane script -->
<script type="text/javascript" src="resources/script/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="resources/script/js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="resources/script/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="resources/script/js/jquery.gpCarousel.js"></script>

<script type="text/javascript">
			$(window).load(function(){
				
					// the main container
				var $GPContainer	= $('#container'),
					// the articles (the thumbs)
					$articles		= $GPContainer.children('div.block'),
					// total number of articles
					totalArticles	= $articles.length,
					// the fullview container
					$fullview		= $('<div id="fullview" class="full-view-elements"></div>').prependTo( $('body') ),
					// the overlay
					$overlay		= $('<div class="overlay"></div>').prependTo( $('body') ),
					
					GridPortfolio	= (function() {
							// current will be the index of the current article
						var animspeed				= 500,
							animeasing				= 'jswing', // try easeOutExpo
							current					= -1,
							// indicates if certain elements can be animated or not at a given time
							animrun					= false,
							init 					= function() {
								initPlugins();
								initEventsHandler();
							},
							// builds each article's carousel
							// initiallizes the mansory
							initPlugins				= function() {
								// apply carousel functionality to the thumbs-wrapper in each article
								$articles.find('div.thumbs-wrapper').gpCarousel();
								
								// apply mansory to the grid items
								$GPContainer.masonry({
									itemSelector	: '.item',
									columnWidth		: 5,
									isAnimated		: true
								});
							},
							// events
							initEventsHandler		= function() {
								// switch to fullview when we click the "View Project" link
								$articles.each( function(i) {
									$(this).find('a.more_link').bind('click.GridPortfolio', function(e) {
										
										if( animrun ) return false;
										animrun			= true;
										
										var $article	= $(this).closest('div.block');
										// update the current value
										current	= $article.index('.block');
										// hide scrollbar
										$('body').css( 'overflow', 'hidden' );
										// preload the fullview image and then start the animation (showArticle)
										var $intro		= $article.find('div.intro');
										$intro.addClass('intro-loading');
										$('<img/>').load(function() {
											$intro.removeClass('intro-loading');
											showArticle( $article, true );
											animrun	= false;
										}).attr('src', $article.data('bgimage'));
										
										return false;
									});
								});
								
								// fullview navigation
								$('#fullview').find('span.full-nav-next').live('click.GridPortfolio', function(e) {
									if( animrun ) return false;
									animrun	= true;
									
									// circular navigation
									if( current === totalArticles - 1 )
										current = 0
									else
										++current;
									// update the fullview current articles number	
									$fullview.find('span.full-nav-current').html( current + 1 );
									
									showFullviewArticle();
								});
								$('#fullview').find('span.full-nav-prev').live('click.GridPortfolio', function(e) {
									if( animrun ) return false;
									animrun	= true;
									
									// circular navigation
									if( current === 0 )
										current = totalArticles - 1
									else	
										--current;
									// update the fullview current articles number	
									$fullview.find('span.full-nav-current').html( current + 1 );
									
									showFullviewArticle();
								});
								
								// switch to thumbs view
								$('#fullview').find('span.full-view-exit').live('click.GridPortfolio', function(e) {
									var $article	= $articles.eq( current );
									hideArticle( $article );
								});

								// window resize 
								// center the background image if in fullview
								// reinitialise jscrollpane
								$(window).bind('resize.GridPortfolio', function(e) {
									var $bgimage	= $fullview.find('img.bg-img');
									if( $bgimage.length )
										centerBgImage( $bgimage );
										
									$fullview.find('div.project-descr-full-wrapper').jScrollPane('reinitialise');
								});
							},
							// the clicked article will be cloned;
							// the clone will be positioned on top of the cloned article;
							// remove every element from the clone except the thumbs wrapper (basically the image);
							// enlarge the clone to the window's width & height;
							// move the thumbs wrapper to the position where the fullview's thumbs wrapper will be placed;
							// at the same time fade in the overlay;
							// build the fullview panel with the right data (template)
							// remove the clone
							
							// this function will also be used when we close the fullview article. In this case,
							// the difference is that we don't animate the values (just set the css values), and the clone is not removed, since we
							// will use it for the animation (back to the thumb position)
							showArticle				= function( $article, anim ) {
								// clone the article
								var	$clone	= $article.clone().css({
									left	: $article.offset().left + 'px',
									top		: $article.offset().top + 'px',
									zIndex	: 1001,
									margin	: '0px',
									height	: $article.height() + 'px'
								}).attr( 'id', 'article-clone' );
								
								// this is the images container which is going to "fly" down
								var $thumbsWrapper	= $clone.find('div.thumbs-wrapper');
								
								// remove unnecessary elements from the clone
								$clone.children().not($thumbsWrapper).remove();
								$clone.find('div.thumbs-nav').remove();
								
								// position the clone on top of the article with the right css style
								var padding	= 20 + 20;
								// animate?
								$.fn.applyStyle = ( anim ) ? $.fn.animate : $.fn.css;
								
								var clonestyle 	= {
									width	: $(window).width() - padding + 'px',
									height	: $(window).height() - padding + 'px',
									left	: '0px',
									top		: $(window).scrollTop() + 'px'
								};
								
								$clone.appendTo( $('body') ).stop().applyStyle( clonestyle, $.extend( true, [], { duration : animspeed, easing : animeasing, complete : function() {
									// show the panel (it will be hidden behing the clone though, until this one is removed)
									$fullview.show()
									
									// use the template "fullviewTmpl" to build the fullview panel with the right data
									var articleFullviewData		= getArticleFullviewData($article);
									articleFullviewData.current	= current + 1;
									articleFullviewData.total	= totalArticles;
									var $fullview_content	= $('#fullviewTmpl').tmpl( articleFullviewData );
									
									$fullview_content.appendTo( $fullview );
									
									// call the gpCarousel plugin on the fullview thumbs-wrapper
									$fullview_content.find('div.thumbs-wrapper').gpCarousel({
										start	: $article.find('div.thumbs-wrapper').data('currentImage')
									});
									
									//jscrollpane
									$fullview_content.find('div.project-descr-full-wrapper').jScrollPane('destroy').jScrollPane({
										verticalDragMinHeight: 40,
										verticalDragMaxHeight: 40
									});
									
									// center bg image
									centerBgImage( $fullview.find('img.bg-img') );
									
									// fade out overlay
									$overlay.stop().css( 'opacity', 0 );
									
									// fade out clone to show the fullview panel. After that remove the clone
									$clone.fadeOut( 300, function() { $clone.remove(); } );
								}}));
								
								// animate the images container to the position where is going to be on fullview
								var thumbsstyle 	= {
									left	: $(window).width() - $thumbsWrapper.width() - 25 + 'px',  // 25 is the margin left / right of the fullview thumbs-wrapper
									top		: ($(window).height() / 2) - ($thumbsWrapper.height() / 2) - 22 + 'px'  // 10 is the margin top / bottom of the fullview thumbs-wrapper
								};
								$thumbsWrapper.stop().applyStyle( thumbsstyle, $.extend( true, [], { duration : animspeed, easing : animeasing} ) );
								
								// fade in overlay
								( anim ) ? $overlay.show().fadeTo( animspeed, 0.7, animeasing ) : $overlay.show().css( 'opacity', 0.7 );
							},
							// close the fullview
							hideArticle				= function( $article ) {
								// create the article's clone. the second argument is false to prevent the clone to be removed
								showArticle( $article, false );
								// hide the overlay for now
								$overlay.hide();
								// reference to the created clone and its thumbs wrapper
								var $clone			= $('#article-clone'),
									$thumbsWrapper	= $clone.find('div.thumbs-wrapper');
								// fade in the clone
								$clone.hide().fadeIn( 200, function() {
									// remove the contents of the fullview container
									$fullview.empty();
									// animate the clone to the article position and size
									$(this).animate({
										left	: $article.offset().left + 'px',
										top		: $article.offset().top + 'px',
										width	: $article.width() + 'px',
										height	: $article.height() + 'px'
									}, animspeed, animeasing, function() {
										// remove the clone
										$clone.remove();
										// show the scrollbar
										$('body').css( 'overflow', 'visible' );
									});
									
									// animate the clone's thumbs wrapper so it moves to the article's thumbs wrapper position
									$thumbsWrapper.animate({
										left	: '0px',
										top		: '0px'
									}, animspeed, animeasing);
									
									// fade out the overlay
									$overlay.show().fadeTo( animspeed, 0, animeasing, function() { $overlay.hide() } );
								});
							},
							// gets the article's necessary info to build the fullview panel
							getArticleFullviewData	= function( $article ) {
								return {
									bgimage			: '<img src="' + $article.data('bgimage') + '" class="bg-img"></img>',
									title 			: $article.find('h2.title').text(),
									thumbs			: $article.find('div.thumbs').html(),
									subline			: $article.find('p.subline').text(),
									description		: $article.find('div.project-descr').html()
								}
							},
							// used when navigating in fullview
							// needs to get the next / previous article's info
							showFullviewArticle		= function() {
								var $article					= $articles.eq( current ),
									articleFullviewData			= getArticleFullviewData($article),
								
									$loading					= $fullview.find('span.loading-small'),
								
									$fullviewImage				= $fullview.find('img.bg-img'),
								
									$fullviewTitle				= $fullview.find('h2.title'),
									
									$fullviewSubline			= $fullview.find('p.subline'),
									
									$fullviewDescriptionWrapper	= $fullview.find('div.project-descr-full-wrapper'),
									$fullviewDescription		= $fullviewDescriptionWrapper.find('div.project-descr-full-content'),
									
									$fullviewProjectDescrFull	= $fullview.find('div.project-descr-full'),
									$fullviewThumbsWrapper		= $fullviewProjectDescrFull.find('div.thumbs-wrapper'),
									$newFullviewThumbsWrapper	= $('<div class="thumbs-wrapper"><div class="thumbs">' + articleFullviewData.thumbs + '</div></div>');
								
								// preload the article's background image
								$loading.show();
								$( articleFullviewData.bgimage ).load(function() {
									$loading.hide();
									var $bgImage	= $(this);
									$bgImage.insertBefore( $fullviewImage );
									// center the bg image
									centerBgImage( $bgImage );
									$fullviewImage.remove(); 
									
									$fullviewTitle.html( articleFullviewData.title );
									
									$fullviewSubline.html( articleFullviewData.subline );
									
									$fullviewDescriptionWrapper.jScrollPane('destroy');
									$fullviewDescription.html( articleFullviewData.description );
									$fullviewDescriptionWrapper.jScrollPane('destroy').jScrollPane({
										verticalDragMinHeight: 40,
										verticalDragMaxHeight: 40
									});
									
									$fullviewThumbsWrapper.remove();
									$fullviewProjectDescrFull.prepend( $newFullviewThumbsWrapper );	
									$newFullviewThumbsWrapper.gpCarousel();
									
									animrun	= false;
								}).attr('src', $article.data('bgimage'));
								
							},
							// centers the background image
							centerBgImage			= function( $img ) {
								var dim	= getImageDim($img);
								//set the returned values and show the image
								$img.css({
									width	: dim.width + 'px',
									height	: dim.height + 'px',
									left	: dim.left + 'px',
									top		: dim.top + 'px'
								});
							},
							//get dimentions of the image,
							//in order to make it full size and centered
							getImageDim				= function($i) {
								var $img     = new Image();
								$img.src     = $i.attr('src');
										
								var w_w	= $(window).width(),
								w_h	= $(window).height(),
								r_w	= w_h / w_w,
								i_w	= $img.width,
								i_h	= $img.height,
								r_i	= i_h / i_w,
								new_w,new_h,
								new_left,new_top;
										
								if(r_w > r_i){
									new_h	= w_h;
									new_w	= w_h / r_i;
								}
								else{
									new_h	= w_w * r_i;
									new_w	= w_w;
								}
										
								return {
									width	: new_w,
									height	: new_h,
									left	: (w_w - new_w) / 2,
									top		: (w_h - new_h) / 2
								};
										
							};
						
						return {
							init	: init
						};
						
					})()
				
				GridPortfolio.init();
				
			});
		</script>