<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/buttons.css" type="text/css">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");
String dhqh=cf.executeQuery("select dhqh from sq_dwxx where dwbh='"+ssfgs+"'");
if (dhqh==null || dhqh.equals(""))
{
	out.println("错误！无电话区号，请联系系统管理员");
	return;
}

%>
<body>
<div class="container" style="padding-top:15px;">
<div class="row">
<div class="col-xs-12">
<div class="panel panel-primary">
  <div class="panel-heading">装修咨询管理 -> 咨询登记 -> 录入数据</div>
  <div class="panel-body">
  <form class="form-horizontal" method="post" action="SaveInsertCrm_zxkhxx.jsp" name="insertform" target="_blank">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label" for="<%=dwbh%>">客户所属分公司</label>
        <div class="col-xs-8">
        <select class="form-control" name="ssfgs">
          <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");%> 
        </select>
        </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">所属设计室</label>  
          <div class="col-xs-8">
          <select class="form-control" name="sjsbh" onChange="changeSjsbh(insertform)">
              <option value=""></option>
              <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3') order by dwbh","");%>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">市场部</label>
          <div class="col-xs-8">
          <select class="form-control" name="ywybm" onChange="changeYwybm(insertform)">
            <option value=""></option>
            <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwflbm='07' and dwlx!='F4' and cxbz='N' order by dwbh","");%>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">业务员</label> 
          <div class="col-xs-8"> 
          <select class="form-control" name="ywy">
            <option value=""></option>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">店长</label>
          <div class="col-xs-8">  
          <select class="form-control" name="dianz">
              <option value=""></option>
              <%
                cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and xzzwbm='店长' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
              %>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">小区类型</label>
          <div class="col-xs-8">  
          <select class="form-control" name="ywyssxz">
              <option value=""></option>
              <%cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");%>
          </select>
        </div>
      </div>
      <div class="form-group form-group-xs has-error">
        <label class="col-xs-4 control-label">*客户姓名</label>
        <div class="col-xs-8">
        <input class="form-control" type="text" name="khxm" maxlength="50" onKeyUp="keyTo(xb[0])">
        <input type="hidden" name="boloniKhbh" maxlength="20" >
        </div>
      </div>
      <div class="form-group form-group-xs has-error">
        <label class="col-xs-4 control-label">*性别</label>
        <div class="col-xs-8">
        <label class="radio-inline">
          <input type="radio" name="xb" value="M" onKeyUp="keyTo(lxfs)"/> 男
        </label>
        <label class="radio-inline">
          <input type="radio" name="xb" value="W" onKeyUp="keyTo(lxfs)"/> 女
        </label>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
       <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">咨询店面</label>
          <div class="col-xs-8">
          <select class="form-control" name="zxdm">
          <%if (dwbh.equals("")){
            out.println("<option value=\"\"></option>");
            cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' and dwlx='F2' order by dwbh",dwbh);
          }else{
            cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
          }
          %> 
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">设计师</label>
          <div class="col-xs-8">
          <select class="form-control" name="sjs">
              <%
                if (!zwbm.equals("04"))
                {
                  out.println("<option value=\"\"></option>");
                  cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
                }
                else{
                  out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
                }
              %>
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">市场部小组</label>
          <div class="col-xs-8">  
          <select class="form-control" name="ywyssxz" onChange="changeYwyssxz(insertform)">
              <option value=""></option>
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">市场部经理</label>
            <div class="col-xs-8">  
            <select class="form-control" name="scbjl">
              <option value=""></option>
              <%cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and xzzwbm='市场部经理' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
              %>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">客户资源性质</label>
            <div class="col-xs-8">  
            <select class="form-control" name="khzyxz">
              <option value=""></option>
              <%cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");%>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">客户经理</label>
            <div class="col-xs-8">   
            <select class="form-control" name="khjl">
              <%
                if (!zwbm.equals("03"))
                {
                  out.println("<option value=\"\"></option>");
                  cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
                
                }
                else{
                  out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
                }
              %>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">洽谈登记表编号</label>
          <div class="col-xs-8">
            <input class="form-control" name="djbbh" type="text" maxlength="20"/>
          </div>
        </div>
    </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group form-group-xs">
          <label class="col-xs-2 control-label">联系方式</label>
          <div class="col-xs-9">
            <div class="input-group">
                <span class="input-group-btn">
                <input class="form-control" name="lxfs" type="text" maxlength="100" readonly/>
                <input type="hidden" name="khlxfs" value="" />
                <button class="btn btn-default" type="button" onClick="if (javaTrim(khxm)=='') {alert('录入[客户姓名]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')">
                  录入电话
                </button>
                </span>        
              </div>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-2 control-label">电子邮件</label>
          <div class="col-xs-10">
            <input class="form-control" type="text" name="email" maxlength="50" placeholder="注意：有多个邮箱用英文逗号分隔">
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group form-group-xs has-error">
            <label class="col-xs-4 control-label">*所属城区</label>
            <div class="col-xs-8">
              <select class="form-control" name="cqbm" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");%> 
              </select>
            </div>
          </div>
          <div class="form-group form-group-xs has-error">
            <label class="col-xs-4 control-label">*小区</label>
            <div class="col-xs-8">
              <input class="form-control" type="text" name="xqbm" maxlength="50"  onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)">
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">街道</label>
            <div class="col-xs-8">
              <input class="form-control" name="jiedao" type="text" onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" maxlength="50">
            </div>
          </div>
          <div class="form-group form-group-xs has-error">
          <label class="col-xs-4 control-label">*楼号</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" name="louhao" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)">
          </div>
        </div>
        </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-2 control-label">房屋地址</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="fwdz" maxlength="100" onKeyUp="keyTo(fwlxbm)" placeholder="注意：房屋地址（城区＋街道＋小区＋楼号）自动生成，不需录入" readonly>
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-2 control-label">有效通信地址</label>
                <div class="col-xs-10">
                  <input class="form-control" name="yxtxdz" type="text" maxlength="100"/>
                </div>
            </div>            
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*是否远程客户</label>
              <div class="col-xs-8">
              <label class="radio-inline">
                <input type="radio" name="sfyckh" value="Y"> 是
              </label>
              <label class="radio-inline">
                <input type="radio" name="sfyckh" value="N"> 否
              </label>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">派单区域</label>
              <div class="col-xs-8">
                <select name="pdqybm" class="form-control">
                <option value=""></option>
                <%cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm","");%>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">参加公司促销活动</label>
              <div class="col-xs-10">
                <select name="cxhdbm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
                  %> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">参加小区促销活动</label>
              <div class="col-xs-10">
                <select name="cxhdbmxq" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
                  %> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">参加展会促销活动</label>
              <div class="col-xs-10">
                <select name="cxhdbmzh" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");%> 
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">所属行业</label>
              <div class="col-xs-8">
                <select name="sshybm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm","");%>
                </select>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">职业</label>
              <div class="col-xs-8">
                <select name="zybm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");%>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">购买意向</label>
              <div class="col-xs-10">
                <input class="form-control" name="gmyx" type="text" value="设计施工、主材、家具、配饰" maxlength="100"/>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">年龄区间</label>
              <div class="col-xs-8">
              <select name="nlqjbm" class="form-control" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">房屋类型</label>
              <div class="col-xs-8">
                <select name="fwlxbm" class="form-control" onkeyup="keyTo(hxbm)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");%>
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">计划交房时间</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="jhjfsj" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">户型</label>
              <div class="col-xs-8">
                <select name="hxbm" class="form-control" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*套内建筑面积</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="fwmj" maxlength="8" onKeyUp="keyTo(fgyqbm)" >
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">预计装修时间</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="yjzxsj" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">
              </div>
            </div> 
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">风格要求</label>
              <div class="col-xs-8">
                <select name="fgyqbm" class="form-control" onKeyUp="keyTo(zxysbm)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">装修预算</label>
              <div class="col-xs-8">
                <select name="zxysbm" class="form-control" onKeyUp="keyGo(yjzxsj)" >
                  <option value=""></option>
                  <%cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*关系客户</label>
              <div class="col-xs-8">
                <select name="khlxbm" class="form-control" onKeyUp="keyGo(hdbz)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");%> 
                </select>
              </div>
            </div> 
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">              
              <label class="col-xs-4 control-label">月收入</label>
              <div class="col-xs-8">
                <select name="ysrbm" class="form-control" onkeyup="keyGo(fj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");%>
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">房价（元/m）</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="fj" maxlength="20" onKeyUp="keyTo(cqbm)" >
              </div>
            </div>
           <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*信息来源</label>
              <div class="col-xs-8">
                <select class="form-control" name="xxlybm" onKeyUp="keyTo(khlxbm)" multiple style="height: 328px">
                  <%cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");%>
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">信息来源说明</label>
              <div class="col-xs-10">
                <input class="form-control" name="xxlysm" type="text" maxlength="100">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*回单标志</label>
              <div class="col-xs-8">
                <select class="form-control" name="hdbz" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(hdr)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");%>
                </select>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">回单人</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="hdr" maxlength="20">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">回单装修地址</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="cgdz" maxlength="100">
                </div>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*是否需回访</label>
              <div class="col-xs-8">
                <label class="radio-inline">
                  <input type="radio" name="sfxhf"  value="Y"/> 需回访
                </label>
                <label class="radio-inline">
                  <input type="radio" name="sfxhf"  value="N"/> 不需回访
                </label>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">回访日期</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="hfrq" maxlength="10" onKeyUp="keyGo(bz)" onDblClick="JSCalendar(this)"/> 
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*量房标志</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input name="lfbz" type="radio" value="N" checked/> 未量房
                  </label>
                  <label class="radio-inline">
                    <input name="lfbz" type="radio" value="Y"/> 已量房
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">量房时间</label>
                <div class="col-xs-8">
                <input class="form-control" type="text" name="lfsj" maxlength="20" onDblClick="JSCalendar(this)"/>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*家装标志</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="jzbz" value="1" checked/> 家装
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="jzbz" value="2"/> 公装
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">车辆品牌</label>
                <div class="col-xs-8">
                  <input class="form-control" name="clpp" type="text" maxlength="20" />
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
                        <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*有效信息标志</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="yzxxbz" value="Y" checked/> 有效信息
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">车牌号</label>
                <div class="col-xs-8">
                  <input class="form-control" name="clpp" type="text" maxlength="20" />
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">穿着描述</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="czms" maxlength="50">
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">功能要求</label>
                <div class="col-xs-10">
                  <textarea name="gnyq" class="form-control"></textarea>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">婚姻情况</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="hyzk" value="已婚"/> 已婚
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="hyzk" value="未婚"/> 未婚
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">是否贷款装修</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="sfdkzx" value="是"/> 是
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="sfdkzx" value="否"/> 否
                  </label>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">孩子年龄</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="hznl" maxlength="20" />
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">老人同住</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="lrtz" value="是"/> 是
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="lrtz" value="否"/> 否
                  </label>
                </div>
            </div>
          </div>
        </div>
                <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">预约量房时间</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="yylfsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">计划出平面图时间</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="jhctsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">计划出施工图时间</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="jhcsgtsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*录入人</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*录入部门</label>
                <div class="col-xs-8">
                 <select name="zxdjbm" class="form-control">
                  <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");%>
              </select>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">下次来访时间</label>
                <div class="col-xs-8">
                  <input type="text" name="xclfsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">计划出效果图时间</label>
                <div class="col-xs-8">
                  <input type="text" name="jhcxgtsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">计划做电子报价时间</label>
                <div class="col-xs-8">
                 <input type="text" name="jhzbjsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*录入时间</label>
                <div class="col-xs-8">
                  <input type="text" name="lrsj" value="<%=cf.today()%>" class="form-control" maxlength="10" readonly>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">备注</label>
                <div class="col-xs-10">
                  <textarea name="bz" onKeyUp="keyTo(savebutton)" class="form-control"></textarea>
                </div>
            </div>
          </div>
        </div>
  </form>
  </div>
    <div class="panel-footer text-center">
    <button class="button button-glow button-rounded button-raised button-action button-small" type="button" onClick="f_do(insertform)" name="savebutton">
      <i class="fa fa-save"></i> 存盘
    </button>
    <button class="button button-glow button-rounded button-raised button-primary button-small" type="button" onClick="insertform.savebutton.disabled=false">
      <i class="fa fa-reset"></i> 允许再次存盘
    </button>
  </div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
  cf.ajax(out);//启用AJAX
%>

var lx;
//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
  try{
   insertform.valuelist.style.display='none';
  }catch(e){

  }
}

//改变输入值
function changheIn(FormName)
{   

  if(event.keyCode==13)//回车
  {
    insertform.valuelist.style.display='none';
  }
  else if(event.keyCode==38)//上箭头
  {
    FormName.valuelist.focus();
    FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
    mark="last";

    oldtext=FormName.xqbm.value;

    FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
  }
  else if(event.keyCode==40)//下箭头
  {
    FormName.valuelist.focus();
    FormName.valuelist.options[0].selected=true;
    mark="first";

    oldtext=FormName.xqbm.value;

    FormName.xqbm.value=FormName.valuelist.options[0].text;
  }
  else{//其它键
    if(FormName.xqbm.value=="") 
    {
      insertform.valuelist.style.display='none';
      return;
    }

    //获取型号列表
    var actionStr="/dhzx/scbkh/GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//    window.open(actionStr);
    lx="1";
    openAjax(actionStr);  
  }

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
  if (lx=="1")
  {
    //去除前面的换行符
    while (true)
    {
      if (ajaxRetStr.substring(0,1)=="\r")
      {
        ajaxRetStr=ajaxRetStr.substring(1);
      }
      else if (ajaxRetStr.substring(0,1)=="\n")
      {
        ajaxRetStr=ajaxRetStr.substring(1);
      }
      else{
        break;
      }
    }

    //生成下拉框
    insertform.valuelist.length=0;

    if (ajaxRetStr!="")
    {
      insertform.valuelist.style.display='block';
      strToItem3(insertform.valuelist,ajaxRetStr);
    }
    else{
      insertform.valuelist.style.display='none';
    }
  }
  else if (lx=="2")
  {
    strToItem2(insertform.sjs,ajaxRetStr);
  }
  else if (lx=="3")
  {
    strToItem2(insertform.ywy,ajaxRetStr);
  }
  else if (lx=="4")
  {
    strToSelect(insertform.ywyssxz,ajaxRetStr);

    var sql;
    sql =" select yhmc";
    sql+=" from sq_yhxx ";
    sql+=" where dwbh='"+insertform.ywybm.value+"'";
    sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
    sql+=" ORDER BY yhmc";

    var actionStr="/ajax/getstr.jsp?sql="+sql;

//    window.open(actionStr);
    lx="3";
    openAjax(actionStr);
  }

}

//改变下拉框条目
function changeItem(FormName,field)
{
  if(event.keyCode==38)//上箭头
  {
    if (mark=="last")
    {
      mark="";
    }

    FormName.xqbm.value=field.options[field.selectedIndex].text;

    if (field.selectedIndex==0)
    {
      if (mark=="first")
      {
        field.value="";
        mark="";

        FormName.xqbm.value=oldtext;

        FormName.xqbm.focus();
      }
      else{
        mark="first";
      }
    }
  }
  else if(event.keyCode==40)//下箭头
  {
    if (mark=="first")
    {
      mark="";
    }

    FormName.xqbm.value=field.options[field.selectedIndex].text;

    if (field.selectedIndex==field.length-1)
    {
      if (mark=="last")
      {
        field.value="";
        mark="";

        FormName.xqbm.value=oldtext
        FormName.xqbm.focus();
      }
      else{
        mark="last";
      }
    }
  }
  else if(event.keyCode==13)//回车
  {
    insertform.valuelist.style.display='none';
    FormName.xqbm.focus();
  }
}

//双击下拉框条目
function selectCk(FormName,field)
{
  insertform.valuelist.style.display='none';
  FormName.xqbm.value=field.options[field.selectedIndex].text;
  FormName.xqbm.focus();
}


function changeSjsbh(FormName)
{
  FormName.sjs.length=1;

  if (FormName.sjsbh.value=="")
  {
    return;
  }


  var sql;
  sql =" select yhmc";
  sql+=" from sq_yhxx ";
  sql+=" where sjsbh='"+FormName.sjsbh.value+"'";
  sql+=" and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') ";
  sql+=" ORDER BY yhmc";

  var actionStr="/ajax/getstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="2";
  openAjax(actionStr);

}

function changeYwyssxz(FormName)
{
  FormName.ywy.length=1;

  if (FormName.ywyssxz.value=="")
  {
    return;
  }


  var sql;
  sql =" select yhmc";
  sql+=" from sq_yhxx ";
  sql+=" where sjsbh='"+FormName.ywyssxz.value+"'";
  sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
  sql+=" ORDER BY yhmc";

  var actionStr="/ajax/getstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="3";
  openAjax(actionStr);

}

function changeYwybm(FormName)
{
  FormName.ywy.length=1;
  FormName.ywyssxz.length=1;

  if (FormName.ywybm.value=="")
  {
    return;
  }

  var sql;
  sql =" select dwbh,dwmc";
  sql+=" from sq_dwxx ";
  sql+=" where dwlx='F4' and cxbz='N' and ssdw='"+FormName.ywybm.value+"'";
  sql+=" ORDER BY dwbh";

  var actionStr="/ajax/selectstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="4";
  openAjax(actionStr);

}

function cf_hdbz(FormName){  
  if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
    FormName.cgdz.value="";
    FormName.hdr.value="";

    FormName.cgdz.disabled=true;
    FormName.hdr.disabled=true;
  }
  else {
    FormName.cgdz.disabled=false;
    FormName.hdr.disabled=false;
  }
}      

function cf_fwdz(FormName)
{  
  FormName.jiedao.value=strTrim(FormName.jiedao.value);
  FormName.xqbm.value=strTrim(FormName.xqbm.value);
  FormName.louhao.value=strTrim(FormName.louhao.value);
  FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
  cf_fwdz(FormName);

  if( javaTrim(FormName.khxm)=="") {
    alert("请输入[客户姓名]！");
    FormName.khxm.focus();
    return false;
  }
  if( !radioChecked(FormName.xb)) {
    alert("请选择[性别]！");
    FormName.xb[0].focus();
    return false;
  }
  if(FormName.lxfs.value=="") {
    alert("请输入[联系方式]！");
    FormName.lxfs.focus();
    return false;
  }

  if(!(isEmail(FormName.email, "电子邮件"))) {
    return false;
  }
  if(!(isNumber(FormName.fj, "房价"))) {
    return false;
  }
  if( javaTrim(FormName.cqbm)=="") {
    alert("请输入[所属区域]！");
    FormName.cqbm.focus();
    return false;
  }
  if( javaTrim(FormName.xqbm)=="") {
    alert("请输入[小区]！");
    FormName.xqbm.focus();
    return false;
  }
  if( javaTrim(FormName.louhao)=="") {
    alert("请输入[楼号]！");
    FormName.louhao.focus();
    return false;
  }
    if( javaTrim(FormName.fwmj)=="") {
    alert("请输入[建筑面积]！");
    FormName.fwmj.focus();
    return false;
  }
/*
*/
  if( javaTrim(FormName.fwdz)=="") {
    alert("请输入[房屋地址]！");
    FormName.fwdz.focus();
    return false;
  }
  if(!(isDatetime(FormName.jhjfsj, "计划交房时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
    return false;
  }
  if( !selectChecked(FormName.xxlybm)) {
    alert("请输入[信息来源]！");
    FormName.xxlybm.focus();
    return false;
  }
  if(!(isNumber(FormName.fwmj, "套内建筑面积"))) {
    return false;
  }
  if(!(isDatetime(FormName.hfrq, "回访日期"))) {
    return false;
  }


  if( !radioChecked(FormName.sfxhf)) {
    alert("请选择[是否需回访]！");
    FormName.sfxhf[0].focus();
    return false;
  }
  if (FormName.sfxhf[0].checked)
  {
    if( javaTrim(FormName.hfrq)=="") {
      alert("请选择[回访日期]！");
      FormName.hfrq.focus();
      return false;
    }
  }
  else{
    FormName.hfrq.value="";
  }

  if( javaTrim(FormName.khlxbm)=="") {
    alert("请选择[关系客户]！");
    FormName.khlxbm.focus();
    return false;
  }

  if( javaTrim(FormName.hdbz)=="") {
    alert("请选择[回单标志]！");
    FormName.hdbz.focus();
    return false;
  }


  if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
    FormName.cgdz.value="";
    FormName.hdr.value="";

    FormName.cgdz.disabled=true;
    FormName.hdr.disabled=true;
  }
  else {
    if( javaTrim(FormName.cgdz)=="") {
      alert("请输入[回单装修地址]！");
      FormName.cgdz.focus();
      return false;
    }
    if( javaTrim(FormName.hdr)=="") {
      alert("请输入[回单人]！");
      FormName.hdr.focus();
      return false;
    }
  }

  if( javaTrim(FormName.yzxxbz)=="") {
    alert("请输入[有效信息标志]！");
    FormName.yzxxbz.focus();
    return false;
  }
   if(  !radioChecked(FormName.lfbz)) {
    alert("请选择[量房标志]！");
    FormName.lfbz[0].focus();
    return false;
  }
  if (FormName.lfbz[1].checked)
  {
    if( javaTrim(FormName.lfsj)=="") {
      alert("请输入[量房时间]！");
      FormName.lfsj.focus();
      return false;
    }
    if(!(isDatetime(FormName.lfsj, "量房时间"))) {
      return false;
    }
  }
  else{
    FormName.lfsj.value="";
  }
  if( !radioChecked(FormName.jzbz)) {
    alert("请选择[家装标志]！");
    FormName.jzbz[0].focus();
    return false;
  }

  if(!(isDatetime(FormName.jhctsj, "计划出平面图时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhcxgtsj, "计划出效果图时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhcsgtsj, "计划出施工图时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhzbjsj, "计划做电子报价时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.yylfsj, "预约量房时间"))) {
    return false;
  }
  if(!(isDatetime(FormName.xclfsj, "下次来访时间"))) {
    return false;
  }
  if( !radioChecked(FormName.sfyckh)) {
    alert("请选择[是否远程客户 ]！");
    FormName.sfyckh[0].focus();
    return false;
  }

  FormName.submit();
  FormName.savebutton.disabled=true;
  return true;
}
//-->
</SCRIPT>