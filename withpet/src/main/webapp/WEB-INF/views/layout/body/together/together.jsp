<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="container">
	<img src="resources/img/img.png" style="margin-top: 0px; margin-left: 5px; width: 400px">
	<a href="donationWrite.do" class="btn btn-danger" style="height: 110px; font-size: 13px; margin-top: 8px; margin-bottom: 8px; padding-top: 43px; cursor: pointer">
	모금함 개설하기 </a>
</div>
<div class="container" id="container">

	<!-- for -->
	<c:forEach items="${donationList}" var="donation"  >
	<div class="item block" data-bgimage="resources/img/images/1.jpg">
		<div class="thumbs-wrapper" style="cursor: pointer">
			<div class="thumbs">
			
				<c:forEach items="${donation.imgPathList}" var="img">
					<img src="${pageContext.request.contextPath}/resources/upload/${img.imgPath}" style="width: 260px; height: 173px"/>
				</c:forEach>
			</div>
		</div>
		<h2 class="title">Personal Works</h2>
		<p class="subline">
			Concept <span class="fancy">&amp;</span> Design
		</p>
		<div class="intro">
			제목 : ${donation.title}<br>
			내용 : ${donation.content}<br>
			협회이름 : ${donation.donationOrg}<br>
			은행 : ${donation.bankName}<br>
			게좌번호 : ${donation.accountNo}<br>
			계좌주 : ${donation.accountHost}<br>
			모금액 : ${donation.dreamMoney}<br>
		</div>
	</div>
	</c:forEach>




	<!-- ------------------------------------------------------------ -->
	<!-- <div class="item block" data-bgimage="resources/img/images/1.jpg">
		<div class="thumbs-wrapper" style="cursor: pointer">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/1.jpg" />
				<img src="resources/img/images/thumbs/2.jpg" />
			</div>
		</div>
		<h2 class="title">Personal Works</h2>
		<p class="subline">
			Concept <span class="fancy">&amp;</span> Design
		</p>
		<div class="intro">
			<p>
				I am alone, and feel the charm of existence in this spot, which was
				created for the bliss of souls like mine. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>O my friend - but it is too much for my strength - I sink
				under the weight of the splendour of these visions!</p>
			<p>A wonderful serenity has taken possession of my entire soul,
				like these sweet mornings of spring which I enjoy with my whole
				heart.</p>
			<p>I am alone, and feel the charm of existence in this spot,
				which was created for the bliss of souls like mine.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/3.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/3.jpg" /> <img
					src="resources/img/images/thumbs/5.jpg" /> <img
					src="resources/img/images/thumbs/6.jpg" />
			</div>
		</div>
		<h2 class="title">Business Cards</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				A collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>It showed a lady fitted out with a fur hat and fur boa who sat
				upright, raising a heavy fur muff that covered the whole of her
				lower arm towards the viewer. Gregor then turned to look out the
				window at the dull weather.</p>
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>O my friend - but it is too much for my strength - I sink
				under the weight of the splendour of these visions!</p>
			<p>A wonderful serenity has taken possession of my entire soul,
				like these sweet mornings of spring which I enjoy with my whole
				heart.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/4.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/4.jpg" /> <img
					src="resources/img/images/thumbs/8.jpg" />
			</div>
		</div>
		<h2 class="title">Lovely Cards Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/11.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/11.jpg" /> <img
					src="resources/img/images/thumbs/12.jpg" /> <img
					src="resources/img/images/thumbs/13.jpg" />
			</div>
		</div>
		<h2 class="title">Serenity Project</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				Nor again is there anyone who loves or pursues or desires to obtain
				pain of itself, because it is pain, but because occasionally <a
					href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/7.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/7.jpg" /> <img
					src="resources/img/images/thumbs/9.jpg" /> <img
					src="resources/img/images/thumbs/10.jpg" />
			</div>
		</div>
		<h2 class="title">Bright Print Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				Drops of rain could be heard hitting the pane, which made him feel
				quite sad. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>However hard he threw himself onto his right, he always rolled
				back to where he was. He must have tried it a hundred times, shut
				his eyes so that he wouldn't have to look at the floundering legs,
				and only stopped when he began to feel a mild, dull pain there that
				he had never felt before.</p>
			<p>"Oh, God", he thought, "what a strenuous career it is that
				I've chosen! Travelling day in and day out.</p>
			<p>Doing business like this takes much more effort than doing
				your own business at home, and on top of that there's the curse of
				travelling, worries about making train connections, bad and
				irregular food, contact with different people all the time so that
				you can never get to know anyone or become friendly with them.</p>
			<p>It can all go to Hell!</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/14.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/14.jpg" /> <img
					src="resources/img/images/thumbs/15.jpg" /> <img
					src="resources/img/images/thumbs/16.jpg" />
			</div>
		</div>
		<h2 class="title">In the clouds Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				It is a paradisematic country, in which roasted parts of sentences
				fly into your mouth. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>When she reached the first hills of the Italic Mountains, she
				had a last view back on the skyline of her hometown Bookmarksgrove,
				the headline of Alphabet Village and the subline of her own road,
				the Line Lane.</p>
			<p>Pityful a rethoric question ran over her cheek, then she
				continued her way. On her way she met a copy. The copy warned the
				Little Blind Text, that where it came from it would have been
				rewritten a thousand times and everything that was left from its
				origin would be the word "and" and the Little Blind Text should turn
				around and return to its own, safe country.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/6.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/6.jpg" /> <img
					src="resources/img/images/thumbs/5.jpg" /> <img
					src="resources/img/images/thumbs/3.jpg" />
			</div>
		</div>
		<h2 class="title">Quantum Design</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				A collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>It showed a lady fitted out with a fur hat and fur boa who sat
				upright, raising a heavy fur muff that covered the whole of her
				lower arm towards the viewer. Gregor then turned to look out the
				window at the dull weather.</p>
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>O my friend - but it is too much for my strength - I sink
				under the weight of the splendour of these visions!</p>
			<p>A wonderful serenity has taken possession of my entire soul,
				like these sweet mornings of spring which I enjoy with my whole
				heart.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/8.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/8.jpg" /> <img
					src="resources/img/images/thumbs/4.jpg" />
			</div>
		</div>
		<h2 class="title">Green Autumn Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/2.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/2.jpg" /> <img
					src="resources/img/images/thumbs/1.jpg" />
			</div>
		</div>
		<h2 class="title">Summer Collection</h2>
		<p class="subline">
			Concept <span class="fancy">&amp;</span> Design
		</p>
		<div class="intro">
			<p>
				I am alone, and feel the charm of existence in this spot, which was
				created for the bliss of souls like mine. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>O my friend - but it is too much for my strength - I sink
				under the weight of the splendour of these visions!</p>
			<p>A wonderful serenity has taken possession of my entire soul,
				like these sweet mornings of spring which I enjoy with my whole
				heart.</p>
			<p>I am alone, and feel the charm of existence in this spot,
				which was created for the bliss of souls like mine.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/5.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/5.jpg" /> <img
					src="resources/img/images/thumbs/3.jpg" /> <img
					src="resources/img/images/thumbs/6.jpg" />
			</div>
		</div>
		<h2 class="title">Cards Deluxe Project</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				A collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>It showed a lady fitted out with a fur hat and fur boa who sat
				upright, raising a heavy fur muff that covered the whole of her
				lower arm towards the viewer. Gregor then turned to look out the
				window at the dull weather.</p>
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>O my friend - but it is too much for my strength - I sink
				under the weight of the splendour of these visions!</p>
			<p>A wonderful serenity has taken possession of my entire soul,
				like these sweet mornings of spring which I enjoy with my whole
				heart.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/8.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/8.jpg" /> <img
					src="resources/img/images/thumbs/4.jpg" />
			</div>
		</div>
		<h2 class="title">Sunshine Print Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/4.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/4.jpg" /> <img
					src="resources/img/images/thumbs/8.jpg" />
			</div>
		</div>
		<h2 class="title">Winter Silence Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>A small river named Duden flows by their place and supplies it
				with the necessary regelialia.</p>
			<p>Separated they live in Bookmarksgrove right at the coast of
				the Semantics, a large language ocean.</p>
			<p>
				His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. <a href="#"
					class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/11.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/11.jpg" /> <img
					src="resources/img/images/thumbs/12.jpg" /> <img
					src="resources/img/images/thumbs/13.jpg" />
			</div>
		</div>
		<h2 class="title">Happy Collection</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				Nor again is there anyone who loves or pursues or desires to obtain
				pain of itself, because it is pain, but because occasionally <a
					href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/9.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/9.jpg" /> <img
					src="resources/img/images/thumbs/7.jpg" /> <img
					src="resources/img/images/thumbs/10.jpg" />
			</div>
		</div>
		<h2 class="title">Awesome Colors Project</h2>
		<p class="subline">
			Concept, design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				Drops of rain could be heard hitting the pane, which made him feel
				quite sad. <a href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>However hard he threw himself onto his right, he always rolled
				back to where he was. He must have tried it a hundred times, shut
				his eyes so that he wouldn't have to look at the floundering legs,
				and only stopped when he began to feel a mild, dull pain there that
				he had never felt before.</p>
			<p>"Oh, God", he thought, "what a strenuous career it is that
				I've chosen! Travelling day in and day out.</p>
			<p>Doing business like this takes much more effort than doing
				your own business at home, and on top of that there's the curse of
				travelling, worries about making train connections, bad and
				irregular food, contact with different people all the time so that
				you can never get to know anyone or become friendly with them.</p>
			<p>It can all go to Hell!</p>
		</div>
	</div>
	<div class="item block" data-bgimage="resources/img/images/12.jpg">
		<div class="thumbs-wrapper">
			<div class="thumbs">
				<img src="resources/img/images/thumbs/12.jpg" /> <img
					src="resources/img/images/thumbs/13.jpg" />
			</div>
		</div>
		<h2 class="title">Fancy Project #23</h2>
		<p class="subline">
			Design <span class="fancy">&amp;</span> print
		</p>
		<div class="intro">
			<p>
				Nor again is there anyone who loves or pursues or desires to obtain
				pain of itself, because it is pain, but because occasionally <a
					href="#" class="more_link">View project</a>
			</p>
		</div>
		<div class="project-descr">
			<p>Drops of rain could be heard hitting the pane, which made him
				feel quite sad.</p>
			<p>"How about if I sleep a little bit longer and forget all this
				nonsense", he thought, but that was something he was unable to do
				because he was used to sleeping on his right, and in his present
				state couldn't get into that position.</p>
			<p>The bedding was hardly able to cover it and seemed ready to
				slide off any moment. His many legs, pitifully thin compared with
				the size of the rest of him, waved about helplessly as he looked.
				"What's happened to me? " he thought. It wasn't a dream.</p>
			<p>His room, a proper human room although a little too small, lay
				peacefully between its four familiar walls. A collection of textile
				samples lay spread out on the table - Samsa was a travelling
				salesman - and above it there hung a picture that he had recently
				cut out of an illustrated magazine and housed in a nice, gilded
				frame.</p>
		</div>
	</div> -->
	<div class="clr"></div>
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