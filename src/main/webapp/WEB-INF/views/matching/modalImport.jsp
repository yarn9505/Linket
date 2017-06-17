<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <div class="row form-group" style='width:100%;'>
        <div class="col-xs-12 col-md-offset-2 col-lg-offset-2 col-md-8 col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                   <!-- 카테고리 -->
                    <h3 id='modalCategory' class="panel-title">Category</h3>
                </div>
                <!-- 이미지 -->
                <div class="panel-image">
                    <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cf9489095e8_1.JPG" class="panel-image-preview" style='margin-bottom:10px;'/>
                    <!-- 거리 -->
                    <p id="modalDistance" style='display:inline;'></p> m<hr/><br/>
                    <!-- 금액(가치) -->
                    <p id="modalValue" style='display:inline;'></p> 원<hr/><br/>
                    <!-- 등록일 -->
                    <p id="modalRegdate" style='display:inline;'></p><hr/><br/>
                    <!-- 거래 완료 여부 -->
                    <p id="modalIsSwap" style='display:inline;'></p><hr/><br/>
                    <!-- 내용 -->
                    <div id="modalContent" style='display:inline;'><hr/><br/>
                    </div>
                </div>
                <div class="panel-footer clearfix">
                    <a href="#download" class="btn btn-primary btn-sm btn-hover pull-left">Save <span class="fa fa-bookmark"></span></a>
                    <a href="#facebook" class="btn btn-success btn-sm btn-hover pull-left" style="margin-left: 5px;">Shr <span class="glyphicon glyphicon-send"></span></a>
                    <a class="btn comsys btn-danger btn-sm btn-hover pull-left" style="margin-left: 5px;">Cmt <span class="fa fa-comment"></span></a>
                    <a href="#share" class="btn btn-warning btn-sm btn-hover pull-left" style="margin-left: 5px;">Like <span class="fa fa-thumbs-up"></span></a>
                    <span class="toggler fa fa-chevron-down pull-right"></span></a>
                </div>
            </div>
            <div class="panel cmts panel-primary" style="display: none;">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Comments
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </button>
                        <ul class="dropdown-menu slidedown">
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-refresh">
                            </span>Refresh</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-ok-sign">
                            </span>Available</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-remove">
                            </span>Busy</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-time"></span>
                                Away</a></li>
                            <li class="divider"></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-off"></span>
                                Sign Out</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body body-panel">
                    <ul class="chat">
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>15 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="panel-footer clearfix">
                    <textarea class="form-control" rows="3"></textarea>
                    <span class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-xs-12" style="margin-top: 10px">
                        <button class="btn btn-warning btn-lg btn-block" id="btn-chat">Send</button>
                    </span>
                </div>
            </div>
        </div>
   </div>