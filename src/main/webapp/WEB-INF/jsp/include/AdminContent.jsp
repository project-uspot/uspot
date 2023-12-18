<%@ page pageEncoding="UTF-8"%>
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span3">
                                    <div class="">
										<c:if test="${loginVO != null}">
											<span class="label label-info">${loginVO.sawonName }</span>님 환영합니다.
										</c:if>
										<c:if test="${loginVO == null }">
											<script>
												window.onload = function(){
													top.location = "/m99.do";
												}
											</script>
										</c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                </div>