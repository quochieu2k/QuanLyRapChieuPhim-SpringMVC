<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="owl-carousel owl-theme slide " id="featured">
					<c:forEach items="${banner}" var="item">
						<a href="${item.link}">
							<div class="item">
								<article class="featured">
									<div class="overlay"></div>
									<figure>

										<img
											src="${pageContext.request.contextPath}/Assets/upload/banner/${item.image}"
											alt="Sample Article">

									</figure>
								</article>
							</div>
						</a>
					</c:forEach>
				</div>
				<div class="line">
					<div>Phim Đang Chiếu</div>
				</div>
				<div class="row">
					<c:forEach items="${phimmoi}" var="phim">
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="row">
								<article class="article col-md-12">
									<div class="inner">
										<figure id="imgpost">
											<a href="<c:url value="/phim/chitiet?id=${phim.id}" />">
												<img
												src="${pageContext.request.contextPath}/Assets/upload/poster/${phim.poster}"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="tenphim">
												<h2>
													<span id="spantenphim">${phim.ten}</span>
												</h2>
											</div>
											<ul id="ulthongtin">
												<li><span class="saptt">Thể loại:</span>&nbsp;&nbsp;${phim.theloai }
												</li>
												<li><span class="saptt">Thời lượng:</span>&nbsp;&nbsp;${phim.thoiluong }&nbsp;&nbsp;Phút
												</li>
												<li><span class="saptt">Khởi chiếu:</span>&nbsp;&nbsp;<fmt:formatDate
														value="${phim.ngaycongchieu}" pattern="dd/MM/yyyy" /></li>
											</ul>
											<footer>
												<a href="#" class="love"> <i
													class="ion-android-favorite-outline"></i>
													<div>99</div>
												</a> <a class="btn btn-primary more"
													href="<c:url value="/phim/lichchieu?id=${phim.id}" />">
													<div>Đặt vé</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="maps">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.830592765794!2d106.68783831411625!3d10.747536262666792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f084760cd35%3A0xf9643c63e560c67a!2zMTU3LzUyIETGsMahbmcgQsOhIFRy4bqhYywgUGjGsOG7nW5nIDEsIFF14bqtbiA4LCBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1557642198305!5m2!1svi!2s"
					width="100%" height="300" frameborder="0" style="border: 0"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>
</section>