<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String rddqbm="";
String hxwzbm="";
String fwdz="";
String lxfs="";
String sjs="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
double lrsjts=0;


double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;

double spzkl=0;
String sfpzqtyh="";
String pzqtyhnr="";

String hth="";
String sfjczjz="";
String zklx="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String qtdh=null;
String email=null;


try {
	conn=cf.getConnection();


	ls_sql="select qtdh,email,cxhdbmxq,cxhdbmzh,dzbjjc,zxkhlrjc,zklx,sfjczjz,spzkl,sfpzqtyh,pzqtyhnr,cxhdbm,shbz,SYSDATE-lrsj lrsjts,louhao,rddqbm,hxwzbm,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		zklx=cf.fillNull(rs.getString("zklx"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		spzkl=rs.getDouble("spzkl");
		sfpzqtyh=cf.fillNull(rs.getString("sfpzqtyh"));
		pzqtyhnr=cf.fillNull(rs.getString("pzqtyhnr"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		lrsjts=rs.getDouble("lrsjts");
		louhao=cf.fillNull(rs.getString("louhao"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=rs.getString("fgyqbm");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center">补录签单信息（<font color="#FF0033">*</font>为必填字段）（客户编号：<%=khbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>合同号</td>
      <td width="34%"> 
        <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>关系客户</td>
      <td width="31%"> 
        <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(khxm)">
          <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">普通客户</option>");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>客户姓名</div>
      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50">
      </td>
      <td width="19%"> 
        <div align="right"><font color="#FF0033">*</font>性别</div>
      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>手机</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">其它电话</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">电子邮件</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">业主身份证号码</td>
      <td width="31%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>所属城区</td>
      <td width="34%"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xqbm)"  onChange="cf_fwdz(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right"><font color="#CC0000">*</font>小区/街道</td>
      <td width="31%"> 
        <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onKeyUp="keyTo(rddqbm)"  onChange="cf_fwdz(insertform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#CC0000">*</font>楼号/门牌号</td>
      <td width="34%"> 
        <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)">
      </td>
      <td colspan="2">注意：<font color="#0000FF">房屋地址</font>（城区＋小区＋楼号）自动生成，不需录入</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000FF">房屋地址</font></div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" value="<%=fwdz%>" size="72" maxlength="100"  onKeyUp="keyTo(cqbm)" readonly>
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">所属热点地区</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">所属环线位置</td>
      <td width="31%"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">年龄区间</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">职业</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">月收入</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">房价</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>设计师</div>
      </td>
      <td width="34%">
        <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where (sq_yhxx.dwbh='"+zxdm+"' or sq_yhxx.jzbm='"+zxdm+"') and sfzszg in('Y','N') and zwbm='04' order by yhmc",sjs);
%> 
        </select>
      </td>
      <td width="19%"> 
        <div align="right">业务员</div>
      </td>
      <td width="31%">
        <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sfzszg in('Y','N') and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='19' order by yhmc",ywy);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>房屋面积</div>
      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>报价级别</td>
      <td width="31%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
	</TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程原报价</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="" size="20" maxlength="16" onChange="calValue(insertform)" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>折扣率</td>
      <td width="31%"> 
        <input type="text" name="zkl" size="8" maxlength="8" value="10" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程签约额</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="" size="20" maxlength="16" readonly >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="31%"> 
        <input type="text" name="suijinbfb" value="" size="8" maxlength="16" onChange="calValue(insertform)" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折前－税金</font></td>
      <td width="34%">
        <input type="text" name="zqsuijin" value="" size="20" maxlength="16" readonly >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折后－税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="" size="20" maxlength="16" readonly >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>折前－管理费</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="" size="20" maxlength="16" onChange="calValue(insertform)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折后－管理费</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="" size="20" maxlength="16" readonly>
      </td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>设计费</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="0" size="20" maxlength="16"  onKeyUp="keyGo(glf)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>服务费</td>
      <td width="31%"> 
        <input type="text" name="glf" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
        <input type="hidden" name="hbqye" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="34%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        是 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])">
        否 </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">返券总金额</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">
      </td>
      <td width="19%" align="right">公司承担返卷额</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否已认证</td>
      <td width="34%"> 
        <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
        是 
        <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
        否 </td>
      <td width="19%" align="right">认证市场</td>
      <td width="31%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>参加公司促销活动</td>
      <td colspan="3"> 
        <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)'||DECODE(jsbz,'Y','（已结束）','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc",cxhdbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF">参加小区促销活动</td>
      <td colspan="3"> 
        <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)'||DECODE(jsbz,'Y','（已结束）','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc",cxhdbmxq);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">参加展会促销活动</td>
      <td colspan="3"> 
        <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)'||DECODE(jsbz,'Y','（已结束）','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc",cxhdbmzh);
%> 
        </select>
      </td>
    </tr>
	</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>家装标志</td>
      <td width="34%"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%></td>
      <td rowspan="5" align="right" width="19%"><font color="#FF0033">*</font>信息来源 
      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(jyjdrq)" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">户型</td>
      <td width="34%"> 
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">风格</td>
      <td width="34%"> 
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">油色</td>
      <td width="34%"> 
        <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(czbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">材质</td>
      <td width="34%"> 
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
	</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">开工时间</td>
      <td width="34%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        已确定 
        <input type="radio" name="kgsjqd" value="N">
        未确定</td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>建议交底日期</td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>签约日期</td>
      <td width="31%"> 
        <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>合同开工日期</td>
      <td width="34%"> 
        <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>合同竣工日期</td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>回单标志</td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz);
%> 
        </select>
      </td>
      <td width="19%" align="right">回单人</td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">回单装修地址</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" onKeyUp="keyGo(bz)" >
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">水质分析卡发放</td>
      <td width="34%"> 
        <input type="radio" name="sffk" value="Y">
        发卡 
        <input type="radio" name="sffk" value="N">
        未发卡 </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">登记卡号</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="" size="20" maxlength="20" >
      </td>
      <td width="19%" align="right">发卡日期</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></div>
      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
      </td>
      <td width="19%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000CC">信息录入人</font></div>
      </td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right">备注</div>
      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
        <input type="button"  value="电子报价打印预览" onClick="f_ck(insertform)" name="ck" >
        <input type="hidden" name="sfcjq" value="1" size="20" maxlength="8" >
        <input type="hidden" name="sffby" value="1" size="20" maxlength="8" >
        <input type="hidden" name="hyklxbm" value="" size="20" maxlength="8" >
        <input type="hidden" name="hykh" value="" size="20" maxlength="8" >
        <input type="hidden" name="yxsjs" value="" size="20" maxlength="10" >
        <input type="hidden" name="yxsjz" value="" size="20" maxlength="10" >
        <input type="hidden" name="sjsbh" value="" size="20" maxlength="5" >
      </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	var qye=FormName.wdzgce.value*FormName.zkl.value/10.0;
	qye=round(qye,2);
	FormName.qye.value=qye;

	var zqsuijin=FormName.wdzgce.value*FormName.suijinbfb.value/100.0;
	FormName.zqsuijin.value=round(zqsuijin,2);      

	var suijin=FormName.qye.value*FormName.suijinbfb.value/100.0;
	FormName.suijin.value=round(suijin,2);      

	var guanlif=FormName.zqguanlif.value*FormName.zkl.value/10.0;
	FormName.guanlif.value=round(guanlif,2);      
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
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
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);


	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("请选择[报价级别]！");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("请输入[报价级别]！");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区/街道]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号/门牌号]！");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}

	if(	javaTrim(FormName.hbqye)=="") {
		alert("请输入[环保项目签约额]！");
		FormName.hbqye.focus();
		return false;
	}
	if(!(isFloat(FormName.hbqye, "环保项目签约额"))) {
		return false;
	}
	if (FormName.sfcjq.value=="2" || FormName.sffby.value=="2")
	{
		if (FormName.hbqye.value=="0")
		{
			alert("请输入[环保项目签约额]！");
			FormName.hbqye.select();
			return false;
		}
	}
	else{
		FormName.hbqye.value="0";
	}

	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}


	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		FormName.yhyy.value="";
	}


	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[工程原报价]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[工程原报价]不能小于[工程签约额]！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[工程签约额]不能为0！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}


	
	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("请输入[税金百分比]！");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "税金百分比"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("错误！[税金百分比]应该在0和100之间！");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqsuijin)=="") {
		alert("请输入[折前税金]！");
		FormName.zqsuijin.select();
		return false;
	}
	if(!(isFloat(FormName.zqsuijin, "折前税金"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[折后税金]！");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "折后税金"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[服务费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "服务费"))) {
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}



	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("请输入[返卷总金额]！");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "返卷总金额"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("请输入[公司承担返卷额]！");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "公司承担返卷额"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[返卷总金额]不能小于[公司承担返卷额]！");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("请输入[认证市场]！");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
		return false;
	}
	if (FormName.qyrq.value>"2008-05-31")
	{
		alert("[签约日期]不能大于[2008-05-31]！");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
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
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "会员有效时间始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "会员有效时间止"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}


	FormName.action="SaveInsertBlCrm_khxx.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
