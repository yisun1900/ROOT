<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String slfsbm=null;
String yqjjsj=null;
String slsj=null;
String tsnr=null;
String lx=null;
String lxmc=null;
String clzt=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String bz=null;


String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;

String wxfl=null;
String ysgd=null;
String ysgdsflz=null;
String sfhsgd=null;
String pdsgd=null;
String hsgdyy =null;
String ssfgs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select tsjlh,khbh,slfsmc,slsj,yqjjsj,tsnr,lx,DECODE(lx,'1','投诉','2','报修') lxmc,clzt,zrbmclzt,jasj,wxsgd,bz";
	ls_sql+=" ,crm_tsjl.hsgdyy,crm_tsjl.sfhsgd,crm_tsjl.pdsgd,crm_tsjl.ysgd,crm_tsjl.ysgdsflz,crm_tsjl.wxfl ";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tsjlh='"+tsjlh+"'";
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hsgdyy=cf.fillNull(rs.getString("hsgdyy"));
		sfhsgd=cf.fillNull(rs.getString("sfhsgd"));
		pdsgd=cf.fillNull(rs.getString("pdsgd"));
		ysgd=cf.fillNull(rs.getString("ysgd"));
		ysgdsflz=cf.fillNull(rs.getString("ysgdsflz"));
		wxfl=cf.fillNull(rs.getString("wxfl"));
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		clzt=cf.fillHtml(rs.getString("clzt"));
		zrbmclzt=cf.fillHtml(rs.getString("zrbmclzt"));
		jasj=cf.fillHtml(rs.getDate("jasj"));
		wxsgd=cf.fillNull(rs.getString("wxsgd"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,dwbh,sgd,zjxm,crm_khxx.fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>分配维修施工队</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">分配维修施工队 </div>
<form method="post" action="SaveEditCrm_tsjl.jsp" name="editform">
  <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">客户编号</td>
      <td width="33%"><%=khbh%></td>
      <td width="19%" align="right">合同号</td>
      <td width="33%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">客户姓名</div>      </td>
      <td width="33%"> <%=khxm%>（<%=lxfs%>） </td>
      <td width="19%"> 
        <div align="right">签约日期</div>      </td>
      <td width="33%"><%=qyrq%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">房屋地址</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">签约店面</div>      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
      <td width="19%"> 
        <div align="right">设计师</div>      </td>
      <td width="33%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">质检</div>      </td>
      <td width="33%"> <%=zjxm%> </td>
      <td width="19%"> 
        <div align="right">施工队&nbsp;</div>      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">结案状态</td>
      <td width="33%"><%
	cf.selectToken(out,"0+未受理&1+已受理&2+在处理&3+结案&9+不立案",clzt,true);
%></td>
      <td rowspan="7" align="right">报修内容</td>
      <td rowspan="7"><%=tsnr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">结案时间</td>
      <td width="33%"><%=jasj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">责任部门处理状态</td>
      <td width="33%"><%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决",zrbmclzt,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">类型</td>
      <td width="33%"><%=lxmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">投诉来源</td>
      <td width="33%"><%=slfsbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">受理时间</td>
      <td width="33%"><%=slsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">要求解决时间</td>
      <td width="33%"><%=yqjjsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">备注</td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="27" align="right" bgcolor="#FFFFCC"><font color="#0000CC">原施工队</font></td>
      <td bgcolor="#FFFFCC"><%=ysgd%></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#0000CC">原施工队是否离职</font></td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out,"Y+离职&N+否",ysgdsflz,true);
				%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="27" align="right" bgcolor="#FFFFCC"><font color="#0000CC">维修分类</font></td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out,"1+保修&2+非保修",wxfl,true);
				%></td>
      <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
      <td bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0033">*</font>是否需施工队</td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out, "sfhsgd","Y+换施工队&N+原施工队&T+不需施工队",sfhsgd);
				%></td>
      <td align="right" bgcolor="#FFFFCC">维修施工队</td>
      <td bgcolor="#FFFFCC"><select name="pdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	   cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc",pdsgd);
%>
      </select></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">换施工队原因</td>
      <td colspan="3" bgcolor="#FFFFCC"><textarea name="hsgdyy" cols="87" rows="3" ><%=hsgdyy%></textarea></td>
    </tr>
    
    <tr> 
      <td colspan="4" align="center"> 
		<input type="hidden" name="tsjlh"  value="<%=tsjlh%>" >
        <input type="hidden" name="ysgd" value="<%=ysgd%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
      <input type="reset"  value="重输"></td>
    </tr>
  </table>
</form>


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfhsgd)) {
		alert("请选择[是否需施工队]！");
		FormName.sfhsgd[0].focus();
		return false;
	}

	if (FormName.sfhsgd[0].checked)
	{
		if(	javaTrim(FormName.hsgdyy)=="") {
			alert("请输入[换施工队原因]！");
			FormName.hsgdyy.focus();
			return false;
		}
	}
	else{
		FormName.hsgdyy.value="";
	}

	if(	javaTrim(FormName.pdsgd)=="") {
		alert("请输入[维修施工队]！");
		FormName.pdsgd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
